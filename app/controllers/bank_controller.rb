class BankController
  def intro
    puts "Welcome to Budget Tracker!"
    puts "If you haven't already, enter your monthly income, otherwise (l)ist your current budget goals."
    command = clean_gets
    if command == "l"
      Router.navigate_goals_menu
    else
      unless /\A[+-]?\d+\Z/.match command
        puts "Amount must be numbers"
        exit
      end
      bank = Bank.create(balance: command)
      puts "Your new account balance is #{bank.balance}"
      Router.navigate_goals_menu
    end
  end
end
