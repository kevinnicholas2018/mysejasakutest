class UrlShort < ApplicationRecord
	belongs_to :url_original, dependent: :destroy
	validates :url_name, presence: true, uniqueness: true
end
