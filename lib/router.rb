class Router
  def self.navigate_goals_menu
    puts "Would you like to add a budget category name? (y)es or (n)o to view a list of your goals. You can also enter the category number to view it."
    command = clean_gets
    case command
    when "y"
      GoalsController.add
    when "n"
      GoalsController.list
    when /\d+/
      GoalsController.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end

  # def self.navigate_training_paths_menu(training_paths_controller)
  #   command = clean_gets
  #
  #   case command
  #   when "add"
  #     training_paths_controller.add
  #   when /\d+/
  #     training_paths_controller.view(command.to_i)
  #   else
  #     puts "I don't know the '#{command}' command."
  #   end
  # end
end
