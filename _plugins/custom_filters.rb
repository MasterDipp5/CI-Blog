module Jekyll
    module CustomFilters
      def custom_div_generator(content)
        sections = content.map(&:strip) # Split and remove any leading/trailing whitespace
        html_output = ''
        left_image = true # Start with the image on the left
  
        sections.each_with_index do |section, index|
          next if section.empty?
  
          image_side_class = left_image ? 'image-left' : 'image-right'
          image_url = "/assets/images/placeholder.jpg" # Replace with your image path logic if needed
  
          html_output += <<-HTML
            <div class="content-section #{image_side_class}">
                <div class="content-text">
                    #{section}
                </div>
                <div class="content-image">
                    <img src="#{image_url}" alt="Section image">
                </div>
            </div>
          HTML
  
          left_image = !left_image # Alternate the image position
        end
  
        html_output
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::CustomFilters)
  