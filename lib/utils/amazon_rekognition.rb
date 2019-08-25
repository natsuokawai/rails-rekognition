class AmazonRekognition
  class << self
    def index_faces(image_path)
      res = client.index_faces({
        collection_id: collection_id,
        image: {
          bytes: File.open(image_path, 'r+b')
        }
      })

      res.to_h[:face_records].map { |face| [face[:face][:face_id], face[:face][:bounding_box]] }.to_h
    end

    def search_faces(face_id)
      res = client.search_faces({
        collection_id: collection_id,
        face_id: face_id,
        face_match_threshold: 95
      })

      searched_face_id = res.to_h[:searched_face_id]
      matched_faces = res.to_h[:face_matches]
      return if matched_faces.blank?

      matched_face_id = matched_faces[0][:face][:face_id]
      { searched_face_id: searched_face_id, matched_face_id: matched_face_id }
    end

    def search_all_faces_by_image(image_path)
      faces = index_faces(image_path)

      matched_faces = faces.map do |face_id, bounding_box|
        result = search_faces(face_id)
        next if result.blank?

        result[:searched_face_bounding_box] = bounding_box
        result
      end

      matched_faces.compact
    end

    def individual_recognition(image_path)
      matched_faces = search_all_faces_by_image(image_path)
      puts "#{matched_faces.size} peeple are matched in the collection of faces."
      return if matched_faces.size == 0

      rimg = Magick::ImageList.new(image_path)
      gc = Magick::Draw.new

      matched_faces.each do |face|
        user = RekognitionFace.find_by(face_id: face[:matched_face_id])&.user
        next if user.blank?

        puts "use_name: " + user.name
        bbox = face[:searched_face_bounding_box]

        x1 = rimg.columns * bbox[:left]
        y1 = rimg.rows * bbox[:top]
        x2 = rimg.columns * (bbox[:left] + bbox[:width])
        y2 = rimg.rows * (bbox[:top] + bbox[:height])

        gc.fill_opacity(0)
        gc.stroke('red')
        gc.stroke_width(3)
        gc.rectangle x1, y1, x2, y2

        gc.fill('black')
        gc.pointsize(50)
        gc.text(x1, y1 - 25, user.name)
      end
      
      gc.draw(rimg)
      rimg.write "app/assets/images/result_#{Time.zone.now}.jpg"
      puts "done!"
    end

    private

    def client
      @client = Aws::Rekognition::Client.new(
                  region: 'ap-northeast-1',
                  access_key_id: '*****',
                  secret_access_key: '*****'
                )
    end

    def collection_id
      'myphotos'
    end
  end
end
