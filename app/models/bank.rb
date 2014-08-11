class Bank < ActiveRecord::Base
  has_many :goals
  has_many :actuals, through: :goals
  validates_presence_of :balance
end
