module ApplicationHelper
  def gravatar_for(user, options = { size:100 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase) # Digest is ruby module
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{options[:size]}"
    image_tag gravatar_url, alt: user.username, class: "img-circle"
  end
end
