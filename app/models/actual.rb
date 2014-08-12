class Actual < ActiveRecord::Base
  validates_presence_of :name, :amount
  belongs_to :goal

  def self.subtract_expenditure(amount, goal_num)
    current_goal = Goal.where({id: goal_num}).first
    total = current_goal.amount - amount
    current_goal.update(amount: total)
    return total
  end

  def self.update_bank_balance(amount)
    current_balance = Bank.last.balance
    new_total = current_balance - amount
    Bank.last.update(balance: new_total)
  end

end
