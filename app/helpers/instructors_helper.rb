module InstructorsHelper
  
  def gravatar_for(instructor, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(instructor.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: instructor.name, class: "gravatar")
  end
end
