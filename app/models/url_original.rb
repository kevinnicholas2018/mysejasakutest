class UrlOriginal < ApplicationRecord
	has_one :url_short, dependent: :destroy
	has_one :url_custom, dependent: :destroy
	validates :url_name, presence: true, uniqueness: true
	validates_format_of :url_name, 
		:with => 
			/\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix,
		:on => 
			:create
	def generate_url_short
		self.url_short = UrlShort.create(url_name: algorithm_shorten_url_encode)
		update_attribute(:url_short_id, self.url_short.id)
	end
	def set_url_custom(url_custom)
		self.url_custom = UrlCustom.create(url_name: url_custom)
		update_attribute(:url_custom_id, self.url_custom.id)
	end
	private
		ALPHA_NUM =
  		"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

		def algorithm_shorten_url_encode
			i = self.id
		  return ALPHA_NUM[0] if i == 0
		  s = ''
		  base = ALPHA_NUM.length
		  while i > 0
		    s << ALPHA_NUM[i.modulo(base)]
		    i /= base
		  end
		  s.reverse
		end
end
