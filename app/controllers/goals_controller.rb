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
    new_balance = Goal.subtract_goal(amount.to_i)
    if goal.new_record?
      puts goal.errors.full_messages
    else
      puts "The #{goal.name} category has been added with an amount of $#{goal.amount}. You now have $#{new_balance} left over."
    end
  end

  def self.list
    puts "=============="
    puts "  Goal List"
    puts "=============="
    goals = Goal.all
    goals.each_with_index do |goal, index|
      puts "#{index + 1}. #{goal.name} $#{goal.amount}"
    end
    Router.navigate_goals_menu
  end

  def self.view(goal_number)

  end
end
