RSpec.describe "Adding monthly income amount", :integration do
  context "valid input" do
    let!(:output){ run_budget_with_input("1000") }
    it "should add a record" do
      expect(Bank.count).to eql 1
    end
    it "should save the record accurately" do
      expect(Bank.last.balance).to eql 100000
    end
    it "should print a success message" do
      expect(output).to include("Your new account balance is $1000")
    end
  end

  context "invalid input" do
    let!(:output){ run_budget_with_input("nine") }
    it "should print the error message for the type of input required" do
      expect(output).to include("Amount must be numbers")
    end
    it "should not save a new record" do
      expect(Bank.count).to eql 0
    end

  end

end
