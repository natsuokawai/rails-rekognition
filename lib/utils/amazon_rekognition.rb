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
