require 'test_helper'

class UrlOriginalsControllerTest < ActionDispatch::IntegrationTest
  test "an url_shorten_algorithm" do
  	500.times do
  		urlOriginal = UrlOriginal.new(url_name: "http://" + SecureRandom.hex(16) + ".com")
  		if(urlOriginal.save)
  			assert urlOriginal.generate_url_short
  		else
  			assert false
  		end
  	end
  end

  test "an url_custom" do 
  	500.times do
  	 urlOriginal = UrlOriginal.new(url_name: "http://" + SecureRandom.hex(16) + ".com")
  		if(urlOriginal.save)
  			assert urlOriginal.set_url_custom(SecureRandom.urlsafe_base64)
  		else
  			assert false
  		end
  	end
  end
end
