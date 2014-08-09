class Goal < ActiveRecord::Base
  belongs_to :bank
  has_many :actuals
  validates_presence_of :name, :amount

  def self.subtract_goal(goal)
    current_balance = Bank.last.balance
    total = current_balance - goal
    total
    # Bank.last.update(balance: total)
  end
end
