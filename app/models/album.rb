class Album < ActiveRecord::Base
	has_many :albumimages
	accepts_nested_attributes_for :albumimages
	belongs_to :user
	belongs_to :profile
	has_many :comments
end
