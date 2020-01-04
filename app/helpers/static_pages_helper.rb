module StaticPagesHelper

    def full_title(page_title = '')
        default_title = "Ruby on Rails Tutorial Sample App"
        if(page_title.empty?)
            return default_title
        end
        "#{page_title} | #{default_title}"
    end
end
