class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  validates :rate, :presence =>true
  validates :review, :presence =>true,length: { maximum: 300}
  RATES = {'Ужасно' => '1','Плохо' => '2','Нормально' => '3','Хорошо' => '4','Отлично' => '5'}
end
