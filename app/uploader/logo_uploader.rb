class LogoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :preview do
    process resize_to_fill: [400, 400]
  end
end
