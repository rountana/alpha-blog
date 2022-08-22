module ApplicationHelper
    
    def gravatar_for(user, options = {size: 80})
        #code reference from gravatar website
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        
        # image_tag is a rails method https://stackoverflow.com/questions/39746936/rails-how-to-convert-img-src-to-image-tag-in-rails-app
        image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end
end