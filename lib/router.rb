class Router
  def self.navigate_goals_menu
    puts "Your current account balance is $#{Actual.convert_to_dollars(Bank.last.balance)}"
    puts "=============="
    puts "  Goal List"
    puts "=============="
    goals = GoalsController.allgoals
    goals.each_with_index do |goal, index|
      puts "#{index + 1}. #{goal.name} $#{Actual.convert_to_dollars(goal.amount)}"
    end
    puts "Would you like to add a budget category name? (y)es or (n)o to view a list of your goals."
    command = clean_gets
    case command
    when "y"
      GoalsController.add
    when "n"
      GoalsController.list
    else
      puts "I don't know the '#{command}' command."
    end
  end

  def self.navigate_actuals_menu
    puts "Would you like to add a transaction? (y)es or you can view your (g)oals."
    command = clean_gets
    case command
    when "y"
      puts "=============="
      puts "  Goal List"
      puts "=============="
      goals = GoalsController.allgoals
      goals.each_with_index do |goal, index|
        puts "#{index + 1}. #{goal.name} $#{Actual.convert_to_dollars(goal.amount)}"
      end
      puts "What is the number of the budget category that this transaction belongs to?"
      response = clean_gets
      if /\A[+-]?\d+\Z/.match response
        ActualsController.add(response)
      else
        puts "I don't know the #{response} command."
      end
    when "g"
      Router.navigate_goals_menu
    else
      puts "I don't know the '#{command}' command."
    end
  end
end
