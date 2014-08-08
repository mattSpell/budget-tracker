class Bank < ActiveRecord::Base
  has_many :goals
  validates_presence_of :balance

end
