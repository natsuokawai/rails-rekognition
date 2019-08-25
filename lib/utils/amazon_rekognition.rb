class AmazonRekognition
  class << self
    def index_faces(image)
      res = client.index_faces({
        collection_id: collection_id,
        image: {
          bytes: image
        }
      })

      res.to_h[:face_records].map { |face| [face[:face_id], face[:bounding_box]] }.to_h
    end

    def search_faces(face_id)
      res = client.search_faces({
        collection_id: collection_id,
        face_id: face_id,
        face_match_threshold: 95
      })

      searched_face_id = res.to_h[:searched_face_id]
      matched_face_id = res.to_h[:face_matches][0][:face][:face_id]

      { searched_face_id: searched_face_id, matched_face_id: matched_face_id }
    end

    def search_all_faces_by_image(image)
      faces = index_faces(image)

      matched_faces = faces.keys.map do |face_id|
        search_faces(face_id)
      end

      matched_faces.map { |face| [face[:face_id], face[:bounding_box]] }.to_h
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
