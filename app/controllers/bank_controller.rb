class BankController
  def intro
    puts "Welcome to Budget Tracker!"
    puts "If you haven't already, enter your monthly income, otherwise (l)ist your current budget goals."
    command = clean_gets
    if command == "l"
      Router.navigate_goals_menu
    else
      unless /[-+]?[0-9]*\.?[0-9]+/.match command
        puts "Amount must be numbers"
        exit
      end
      command = Actual.convert_to_cents(command.to_f)
      bank = Bank.create(balance: command)
      puts "Your new account balance is $#{Actual.convert_to_dollars(bank.balance)}"
      Router.navigate_goals_menu
    end
  end
end
