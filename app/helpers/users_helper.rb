module UsersHelper

  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}?"
    image_tag(gravatar_url, alt:user.username, class: "gravatar")
  end




end
