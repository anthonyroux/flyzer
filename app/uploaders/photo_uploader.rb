# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
