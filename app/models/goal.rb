class Goal < ActiveRecord::Base
  belongs_to :bank
  has_many :actuals
  validates_presence_of :name, :amount
end
