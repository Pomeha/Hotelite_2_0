class Hotel < ApplicationRecord
	include AASM
	belongs_to :user
	has_many :reviews,:dependent => :destroy
	paginates_per 5
	mount_uploader :image, ImageUploader
	validates :name, :presence => true,length: { maximum: 50}
	validates :address, :presence => true,length: { maximum: 100}
	validates :description, :presence => true,length: { maximum: 1000}
	validates :price, :presence =>true, numericality: { only_integer: true,:greater_than =>0 }
	validates :star, :presence =>true
	aasm do
		state :pending, :initial => true
		state :approved, :rejected
		event :approve do
			transitions :from => :pending, :to => :approved
		end

		event :reject do
			transitions :from => :pending, :to => :rejected
		end
  	end
end
