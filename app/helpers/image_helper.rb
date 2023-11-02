module ImageHelper
  def image_tag(url, options = {})
    options[:alt] = 'avatar' unless options[:alt]
    options[:width] = 100 unless options[:width]
    options[:height] = 100 unless options[:height]

    tag.img(src: url, **options)
  end
end
