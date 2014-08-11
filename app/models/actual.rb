class Actual < ActiveRecord::Base
  validates_presence_of :name, :amount
  belongs_to :goal

  def self.subtract_expenditure(amount)
    current_goal = Goal.last.amount
    total = current_goal - amount
    Goal.last.update(amount: total)
    return total
  end

  def self.update_bank_balance(amount)
    current_balance = Bank.last.balance
    new_total = current_balance - amount
    Bank.last.update(balance: new_total)
  end

end
