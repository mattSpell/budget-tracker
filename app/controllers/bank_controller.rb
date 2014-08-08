class BankController
  def intro
    puts "Welcome to Budget Tracker!"
    puts "What is your monthly income?"
    balance = clean_gets
    unless /\A[+-]?\d+\Z/.match balance
      puts "Amount must be numbers"
      exit
    end

    bank = Bank.create(balance: balance)

    # puts bank.errors.full_messages
    puts "Your new account balance is #{bank.balance}"

  end
end
