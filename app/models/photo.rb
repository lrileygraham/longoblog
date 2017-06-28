class Photo < ApplicationRecord
  has_attached_file :image, styles: {large: "700x700>", medium: "400x400>", thumb: "250x250#"}, default_url: "http://cumberlandsmagic.com/wp-content/themes/vipology_04/images/missing-image-232x150.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def next
    Photo.where("id > ?", id).limit(1).first
  end

  def prev
    Photo.where("id < ?", id).limit(1).first
  end

end
