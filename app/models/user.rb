class User < ApplicationRecord
  has_many :rekognition_faces

  class << self
    def in_the_image(image_path)
      faces = RekognitionFace.search(image_path)
      where(id: faces.pluck(:user_id))
    end
  end

  def register_face(image_path)
    rekognition_faces.factory!(self, image_path)
  end
end
