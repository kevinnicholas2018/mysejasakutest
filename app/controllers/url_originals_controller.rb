class UrlOriginalsController < ApplicationController
	def new
		 
	end

	def index
		@urlOriginal = UrlOriginal.new
	end

	def create
		urlOriginal = UrlOriginal.new(url_original_permit)
		if(urlOriginal.save)
			successUrl = ""
			if(url_custom = params[:url_original][:url_custom])
				urlOriginal.set_url_custom(url_custom)
				successUrl = urlOriginal.url_custom.url_name
			else
				urlOriginal.generate_url_short
				successUrl = urlOriginal.url_short.url_name
			end
			session[:success] = successUrl 
			session[:danger] = nil
		else
			if(urlOriExist = UrlOriginal.find_by(url_name: urlOriginal.url_name))
				successUrl ||= urlOriExist.url_short
				successUrl ||= urlOriExist.url_custom
				session[:success] = successUrl.url_name
			end
			session[:danger] = urlOriginal.errors.messages
		end
		redirect_to root_path
	end

	def show
		urlShortRequest = params[:id]
		url_path ||= UrlShort.find_by(url_name: urlShortRequest)
		url_path ||= UrlCustom.where(url_name: urlShortRequest).order("created_at").last
	 	if(url_path)
	 		url_path = url_path.url_original.url_name
	 		redirect_to url_path
	 	else
	 		@error = "The shorturl you were looking for was not found"
	 	end
	end

	private
		def url_original_permit
			params.require(:url_original).permit(:url_name)
		end
end
