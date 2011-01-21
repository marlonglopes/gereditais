# encoding: utf-8

class ApplicationController < ActionController::Base

	before_filter :set_locale

	include ControllerAuthentication

	protect_from_forgery

#	protect_from_forgery :except => :upload
#	skip_before_filter :verify_authenticity_token, :only => :upload

	def set_locale
	  # if params[:locale] is nil then I18n.default_locale will be used
  		locale = params[:locale] || 'pt'
	  	I18n.locale = locale
  		I18n.load_path += Dir[ File.join(Rails.root.to_s, 'lib', 'locale', '*.{rb,yml}') ]
	end

end
