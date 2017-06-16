class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
  has_attached_file :image, styles: {large: "800x800>", medium: "400x400>", thumb: "150x150#"}, default_url: "http://cumberlandsmagic.com/wp-content/themes/vipology_04/images/missing-image-232x150.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
