class AvatarUploader < CarrierWave::Uploader::Base

  storage :grid_fs

  version :thumb do
    process :resize_to_fill => [80,80]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
