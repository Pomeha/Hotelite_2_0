class Hotel < ApplicationRecord
	belongs_to :user
	has_many :reviews,:dependent => :destroy
	paginates_per 5
	mount_uploader :image, ImageUploader
	validates :name, :presence => true,length: { maximum: 50}
	validates :address, :presence => true,length: { maximum: 100}
	validates :description, :presence => true,length: { maximum: 1000}
	validates :price, :presence =>true, numericality: { only_integer: true,:greater_than =>0 }
	validates :star, :presence =>true
end
