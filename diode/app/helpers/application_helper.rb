module ApplicationHelper
  # helper method for generate user profile avatar image url
  # availble options example: {:s=>200 , :r=>pg , :d=>404}
  # reference: http://en.gravatar.com/site/implement/images/ http://en.gravatar.com/site/implement/images/ruby/
  def avatar(user, options={})
    if ((user.has_attribute? :image_url) && user.image_url.present?) then
      user.image_url
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      options = {:s=>48 , :r=>"pg" , :d=>"mm"}.merge(options)
      url_options = '?'+options.map {|k,v|  [k.to_s, v.to_s].join('=')}.join('&')
      image_url = "http://gravatar.com/avatar/#{gravatar_id}.png#{url_options}"
    end
  end
end
