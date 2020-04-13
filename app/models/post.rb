class Post < ApplicationRecord
    belongs_to :user
    validates_presence_of :image_url
    validates_format_of :image_url, :with => %r{(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?(gif|jpg|png|jpeg|bmp)$)}ix, :message => 'must be a URL for GIF, JPG, PNG, JPEG, or BMP image'
end
