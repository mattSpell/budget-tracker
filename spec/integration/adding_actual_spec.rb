RSpec.describe "Adding transactions and amounts", :integration do
  context "valid input" do
    let!(:output){ run_budget_with_input("1000", "y", "Food", "100", "y", "1", "Maffiaoza's", "20") }
    it "should add a record" do
      expect(Actual.count).to eql 1
    end
    it "should save the record accurately" do
      expect(Actual.last.name).to include("Maffiaoza's")
      expect(Actual.last.amount).to eql 20
      expect(Actual.last.goal_id).to eql Goal.last.id
    end
    it "should print a success message with the correct remaining balance" do
      expect(output).to include("Maffiaoza's has been added with an amount of $20. Your remaining balance for Food is $80.")
    end
    it "should update the current bank balance" do
      expect(Bank.last.balance).to eql 980
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
