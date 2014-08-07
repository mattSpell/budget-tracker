class Goal < ActiveRecord::Base
  belongs_to :bank
  has_many :actuals
end
