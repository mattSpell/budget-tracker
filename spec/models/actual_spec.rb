RSpec.describe Actual do
  it { should belong_to :goal }
  it { should validate_presence_of :name }
  it { should validate_presence_of :amount }

  context ".subtract_expenditure" do
    let!(:output){ run_budget_with_input("2000", "y", "Food", "100", "y", "1", "Maffiaoza's", "20") }
    it "should subtract the actual from the bank balance" do
      expect(Bank.last.balance).to eql 1980
    end

  end
end
