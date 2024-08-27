class SystemIntegratorPartnershipImageUploader < Shrine

    plugin :derivatives, create_on_promote: true
    plugin :default_url
    plugin :remove_attachment

    Attacher.validate do
        validate_mime_type %w[image/jpeg image/png image/webp]
        validate_max_size  50*1024*1024
    end
    
    Attacher.derivatives do |original|
        magick = ImageProcessing::MiniMagick.source(original)
        
        {
            large:  magick.resize_to_limit!(800, 800),
            medium: magick.resize_to_limit!(500, 500),
            small:  magick.resize_to_limit!(300, 300),
        }
    end
   
end