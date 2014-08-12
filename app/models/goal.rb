class Goal < ActiveRecord::Base
  belongs_to :bank
  has_many :actuals
  validates_presence_of :name, :amount

  # def self.subtract_goal(goal_amount)
  #   current_balance = Bank.last.balance
  #   total = current_balance - goal_amount
  #   total
  # end
end
