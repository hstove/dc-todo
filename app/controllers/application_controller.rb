class ApplicationController < ActionController::Base
  require "net/http"
  require "uri"
  protect_from_forgery

	helper_method :current_user, :dc_event

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def dc_event(key, val)
    p current_user.inspect
    key = ENV['dc_key'] || "fb97a38f-2e09-4edc-a47e-ccd73ed52257"
    secret = ENV['dc_secret'] || "b15f65c2-22f9-4ccc-bfd4-6f80cc7559a3-b3961bc1-0ad3-4608-9f45-4ad52a145b39"
    response = Net::HTTP.post_form(URI.parse("http://localhost:9000/admin/api/customevent.json"), {"key" => key, "val" => val, :client_id => key, :client_secret => secret, :user_id => current_user.uid}) if !current_user.nil?
  end
end
