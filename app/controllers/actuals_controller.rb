class ActualsController
  def self.add(goal_num)
    puts "What is the name for the transaction?"
    name = clean_gets
    puts "What is the amount of your expenditure?"
    amount = clean_gets
    unless /[-+]?[0-9]*\.?[0-9]+/.match amount
      puts "Amount must be numbers"
      exit
    end
    amount = Actual.convert_to_cents(amount.to_f)
    actual = Actual.create(name: name, amount: amount, goal_id: goal_num)
    if actual.new_record?
      puts actual.errors.full_messages
    else
      new_balance = Actual.subtract_expenditure(amount, goal_num)
      Actual.update_bank_balance(amount)
      puts "#{actual.name} has been added with an amount of $#{Actual.convert_to_dollars(Actual.last.amount)}. Your remaining balance for this category is $#{Actual.convert_to_dollars(new_balance)}."
    end
  end
end
