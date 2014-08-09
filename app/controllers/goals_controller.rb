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
      Router.navigate_actuals_menu
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
    puts "Type the goal number to view it."
    command = clean_gets
    if /\d+/.match command
      GoalsController.view(command.to_i)
    else
      Router.navigate_goals_menu
    end
  end

  def self.view(goal_number)
    puts "==============="
    puts "Transacion List"
    puts "==============="
    transactions = Actual.all
    transactions.each_with_index do |actual, index|
      puts "#{index + 1}. #{actual.name} $#{actual.amount}"
    end
    puts "Would you like to add a transaction? (y)es or (n)o to view goals."
    command = clean_gets
    if command == "y"
      ActualsController.add
    else
      Router.navigate_goals_menu
    end
  end
end
