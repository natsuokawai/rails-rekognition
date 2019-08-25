class RekognitionFace < ApplicationRecord
  belongs_to :user

  class << self
    def factory!(user, face_id)
      user.rekognition_faces.create(face_id: face_id)
    end
  end
end
