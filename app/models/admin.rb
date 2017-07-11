class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :timeoutable, :rememberable
end