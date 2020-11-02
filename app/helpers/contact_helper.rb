# frozen_string_literal: true

module ContactHelper
  def contact_image(contact, **args)
    url = "https://avatars.dicebear.com/api/initials/#{contact.full_name}.svg?options[bold]=1"
    image_tag(url, alt: contact.full_name, **args)
  end
end
