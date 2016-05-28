class Article < ActiveRecord::Base
	validates :title, presence: true
	validates :body, presence: true, length: {minimum: 20}
	belongs_to :user
	before_create :set_visits_count
	has_many :comments

	has_attached_file :cover
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/


	def update_visits_count
		self.visits_count ||= 0
		self.update(visits_count: self.visits_count + 1)
	end

	private

	def set_visits_count
		self.visits_count = 0
	end
end
