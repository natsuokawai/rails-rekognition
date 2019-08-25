class AmazonRekognition
  def initialize
    Aws.config[:region] = '*****'
    Aws.config[:access_key_id] = '*****'
    Aws.config[:secret_access_key] = '*****'

    @client = Aws::Rekognition::Client.new
    @collection_id = 'myphotos'
  end

  def index_faces(image)
    res = @client.index_faces({
      collection_id: @collection_id,
      image: {
        bytes: image
      }
    })

    res.to_h[:face_records].map { |face| [face[:face_id], face[:bounding_box]] }.to_h
  end

  def search_faces(face_id)
    res = @client.search_faces({
      collection_id: @collection_id,
      face_id: face_id,
      face_match_threshold: 95
    })

    searched_face_id = res.to_h[:searched_face_id]
    matched_face_id = res.to_h[:face_matches][0][:face][:face_id]
    
    { searched_face_id: searched_face_id, matched_face_id: matched_face_id }
  end

  def search_all_faces_by_image(image_path)
    faces = index_faces(@collection_id, image_path)

    matched_faces = faces.keys.map do |face_id|
      search_faces(@collection_id, face_id)
    end

    matched_faces.map { |face| { face_id: face[:face_id], bounding_box: face[:bounding_box]}}
  end
end