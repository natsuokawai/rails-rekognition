class CreateRekognitionFaces < ActiveRecord::Migration[6.0]
  def change
    create_table :rekognition_faces do |t|
      t.integer :user_id
      t.string :face_id

      t.timestamps
    end
  end
end
