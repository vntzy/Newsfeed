CarrierWave.configure do |config|
  config.storage = :grid_fs
  config.cache_dir = "uploads/tmp"
  config.grid_fs_access_url = "/"
end