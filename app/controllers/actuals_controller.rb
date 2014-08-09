class ActualsController
  def self.add
    puts "What is the name for the transaction?"
    name = clean_gets
    puts "What is the amount of your expenditure?"
    amount = clean_gets
    if amount == ""
      puts "Amount can't be blank"
    end
    actual = Actual.create(name: name, amount: amount.to_i)
    if actual.new_record?
      puts actual.errors.full_messages
    else
      new_balance = Actual.subtract_expenditure(amount.to_i)
      Actual.update_bank_balance(amount.to_i)
      puts "#{actual.name} has been added with an amount of $#{actual.amount}. Your remaining balance for #{Goal.last.name} is $#{new_balance}."
    end
  end

  def self.list
    puts "================"
    puts "Transaction List"
    puts "================"
    transaction = Actual.all
    goals.each_with_index do |goal, index|
      puts "#{index + 1}. #{goal.name} $#{goal.amount}"
    end
    Router.navigate_goals_menu
  end
end
