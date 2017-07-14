class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  validates :rate, :presence =>true, numericality: { only_integer: true,:greater_than =>0, less_than_or_equal_to: 5 }
  validates :review, :presence =>true,length: { maximum: 300}
  validates_uniqueness_of :user_id, :scope => :hotel_id
  RATES = {'Ужасно' => '1','Плохо' => '2','Нормально' => '3','Хорошо' => '4','Отлично' => '5'}
end
