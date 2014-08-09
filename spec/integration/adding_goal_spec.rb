RSpec.describe "Adding monthly budget categories and amounts", :integration do
  context "valid input" do
    let!(:output){ run_budget_with_input("1000", "y", "Food", "100") }
    it "should add a record" do
      expect(Goal.count).to eql 1
    end
    it "should save the record accurately" do
      expect(Goal.last.name).to include("Food")
      expect(Goal.last.amount).to eql 100
    end
    it "should print a success message" do
      expect(output).to include("The Food category has been added to the budget with an amount of $100.")
    end
  end

  context "invalid name" do
    let!(:output){ run_budget_with_input("1000", "y", "") }
    it "prints an error message for blank name" do
      expect(output).to include("Name can't be blank")
    end
    it "doesn't create a goal" do
      expect(Goal.count).to eq 0
    end
  end

  context "invalid amount" do
    let!(:output){ run_budget_with_input("1000", "y", "Video Games", "") }
    it "prints an error message for blank amount" do
      expect(output).to include("Amount can't be blank")
    end
  end

  # context "updates bank balance" do
  #   let!(:output){ run_budget_with_input("1000", "y", "Food", "100") }
  #   expect(Bank.last.balance).to eql 900
  #
  # end
end
