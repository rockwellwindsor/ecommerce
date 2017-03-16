# config/initializers/paperclip.rb
Paperclip.interpolates :dynamic_path do |attachment, style|
  file_name = attachment.original_filename
  folder = attachment.instance.gender
  product = attachment.instance.title
  "products/#{folder}/#{product}/#{style}/#{file_name}"
end