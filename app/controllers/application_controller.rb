class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_user, :dc_event

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def dc_event(key, val)
    client_id = ENV['dc_key'] || "fb97a38f-2e09-4edc-a47e-ccd73ed52257"
    secret = ENV['dc_secret'] || "b15f65c2-22f9-4ccc-bfd4-6f80cc7559a3-b3961bc1-0ad3-4608-9f45-4ad52a145b39"
    connection = Faraday::Connection.new 'https://www.dailycred.com', :ssl => { :ca_file => "/opt/local/share/curl/curl-ca-bundle.crt" }
    opts = {
      :client_id => client_id,
      :client_secret => secret,
      :key => key,
      :valuestring => val,
      :user_id => current_user.uid
    }
    response = connection.post "/admin/api/customevent.json", opts
    p response.body
  end
end
