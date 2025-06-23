# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

# https://gist.github.com/ahamid/995663
  # IMAGE_EXTENSIONS = %w(jpg jpeg gif png tif)

  # create a new "process_extensions" method.  It is like "process", except
  # it takes an array of extensions as the first parameter, and registers
  # a trampoline method which checks the extension before invocation
  # def self.process_extensions(*args)
  #   extensions = args.shift
  #   args.each do |arg|
  #     if arg.is_a?(Hash)
  #       arg.each do |method, args|
  #         processors.push([:process_trampoline, [extensions, method, args]])
  #       end
  #     else
  #       processors.push([:process_trampoline, [extensions, arg, []]])
  #     end
  #   end
  # end

  # our trampoline method which only performs processing if the extension matches
  # def process_trampoline(extensions, method, args)
  #   extension = File.extname(original_filename).downcase
  #   extension = extension[1..-1] if extension[0,1] == '.'
  #   self.ethod, *args) if extensions.include?(extension)
  # end

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # version :thumb do
  #   process resize_to_fill: [250,250]
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb, :if => :image? do
    process :resize_to_fit => [50, 50]
  end

  version :medium, :if => :image? do
    process :resize_to_fit => [250, 250]
  end

  version :large, :if => :image? do
    process :resize_to_fit => [600, 600]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png tif)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
protected
  def image?(new_file)
    %w(jpg jpeg gif png JPG JPEG GIF PNG).include?(new_file.extension.to_s) && model.attach_type == "Images"
  end

end
