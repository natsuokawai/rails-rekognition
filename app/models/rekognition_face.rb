class RekognitionFace < ApplicationRecord
  belongs_to :user

  class << self
    def factory!(user, face_id)
      user.rekognition_faces.create(face_id: face_id)
    end

    def search(image)
      face_ids = AmazonRekognition.search_all_faces_by_image(image)
      where(face_id: face_ids)
    end
  end
end
