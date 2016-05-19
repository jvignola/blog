class Article < ActiveRecord::Base
	validates :title, presence: true
	validates :body, presence: true, length: {minimum: 20}
end
