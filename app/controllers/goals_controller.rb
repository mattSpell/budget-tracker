class GoalsController
  def self.add
    puts "What is the name of the budget category you would like to add?"
    name = clean_gets
    puts "What is the amount of your monthly goal for this category?"
    amount = clean_gets
    if amount == ""
      puts "Amount can't be blank"
    end
    goal = Goal.create(name: name, amount: Actual.convert_to_cents(amount.to_f), bank_id: Bank.last.id)
    if goal.new_record?
      puts goal.errors.full_messages
    else
      puts "The #{goal.name} category has been added with an amount of $#{Actual.convert_to_dollars(goal.amount)}."
      Router.navigate_actuals_menu
    end
  end

  def self.list
    puts "=============="
    puts "  Goal List"
    puts "=============="
    goals = GoalsController.allgoals
    goals.each_with_index do |goal, index|
      puts "#{index + 1}. #{goal.name} $#{Actual.convert_to_dollars(goal.amount)}"
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
    goal = GoalsController.allgoals[goal_number - 1]
    if goal.nil?
      puts "Sorry, #{goal_number} doesn't exist."
    else
      puts "GOAL: #{goal.name} AMOUNT: #{Actual.convert_to_dollars(goal.amount)}"
    end
    puts "============================="
    puts "Transacion List For This Goal"
    puts "============================="
    transactions = Actual.where({goal_id: goal.id})
    transactions.each_with_index do |actual, index|
      puts "#{index + 1}. #{actual.name} $#{Actual.convert_to_dollars(actual.amount)}"
    end
    puts "Would you like to add a transaction? (y)es or (n)o to view goals."
    command = clean_gets
    if command == "y"
      ActualsController.add(goal_number)
    else
      Router.navigate_goals_menu
    end
  end

  def self.allgoals
    @goals ||= Goal.all
  end

end
