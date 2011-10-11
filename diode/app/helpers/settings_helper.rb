module SettingsHelper
  #see https://github.com/plataformatec/devise/wiki/How-To:-Display-a-custom-sign_in-form-anywhere-in-your-app
  def resource_name
     :user
   end

   def resource
     user ||= current_user
     user ||= User.new
     @resource ||= user
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end
end
