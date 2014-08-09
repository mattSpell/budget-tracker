class Router
  def self.navigate_goals_menu
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
    puts "Would you like to add a transaction? (y)es or (n)o to view a list of your transactions for this goal. You can also view your (g)oals."
    command = clean_gets
    case command
    when "y"
      ActualsController.add
    when "n"
      ActualsController.list
    when "g"
      Router.navigate_goals_menu
    else
      puts "I don't know the '#{command}' command."
    end
  end
end
