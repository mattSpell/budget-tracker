class GoalsController
  def self.add
    puts "What is the name of the budget category you would like to add?"
    name = clean_gets
    puts "What is the amount of your monthly goal for this category?"
    amount = clean_gets
    if amount == ""
      puts "Amount can't be blank"
    end
    goal = Goal.create(name: name, amount: amount.to_i)
    if goal.new_record?
      puts goal.errors.full_messages
    else
      puts "The #{goal.name} category has been added to the budget with an amount of $#{goal.amount}."
    end
  end

  def self.list
    puts "=============="
    puts " Goals List"

  end
end
