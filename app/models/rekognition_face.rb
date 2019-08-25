class RekognitionFace < ApplicationRecord
  belongs_to :user

  class << self
    def factory!(user, image_path)
      res = AmazonRekognition.index_faces(image_path)
      raise ArgumentError, 'Persons in the picture should be one.' if res.size > 1

      user.rekognition_faces.create(face_id: res.keys[0])
    end

    def search(image_path)
      faces = AmazonRekognition.search_all_faces_by_image(image_path)
      matched_face_ids = faces.map { |face| face[:matched_face_id] }
      where(face_id: matched_face_ids)
    end
  end
end
