class Rmagic
  def self.draw_annotation(image_path, label, bbox)
    rimg = Magick::ImageList.new(image_path)
    gc = Magick::Draw.new

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
    gc.text(x1, y1 - 25, name)

    gc.draw(rimg)
    rimg.write "app/assets/images/result_#{Time.zone.now}.jpg"
  end
end