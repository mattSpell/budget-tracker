RSpec.describe "Adding transactions and amounts", :integration do
  context "valid input" do
    let!(:output){ run_budget_with_input("1000", "y", "Food", "100", "y", "1", "Maffiaoza's", "20") }
    let!(:output2){ run_budget_with_input("l", "n", "1", "y", "Jets", "15") }
    it "should add a record" do
      expect(Actual.count).to eql 2
    end
    it "should save the record accurately" do
      expect(Actual.last.name).to include("Jets")
      expect(Actual.last.amount).to eql 15
      expect(Actual.last.goal_id).to eql Goal.last.id
    end
    it "should print a success message with the correct remaining balance" do
      expect(output).to include("Maffiaoza's has been added with an amount of $20. Your remaining balance for this category is $80.")
    end
    it "should correctly update goal and bank balances" do
      expect(Goal.last.amount).to eql 65
      expect(Bank.last.balance).to eql 965
    end
  end

  context "invalid name" do
    let!(:output){ run_budget_with_input("1000", "y", "Food", "y", "") }
    it "prints an error message for blank name" do
      expect(output).to include("I don't know the '' command")
    end
    it "doesn't create an actual" do
      expect(Actual.count).to eq 0
    end
  end

  context "invalid amount" do
    let!(:output){ run_budget_with_input("1000", "y", "Video Games", "the store", "") }
    it "prints an error message for blank amount" do
      expect(output).to include("I don't know the '' command")
    end
  end

end
