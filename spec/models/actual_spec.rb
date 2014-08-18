RSpec.describe Actual do
  it { should belong_to :goal }
  it { should validate_presence_of :name }
  it { should validate_presence_of :amount }

  context ".convert_to_cents" do
    let!(:cents){ Actual.convert_to_cents(20) }
    it "should convert the dollar amount to change" do
      expect(cents).to eql 2000
    end
  end

  context ".convert_to_dollars" do
    let!(:dollars){ Actual.convert_to_dollars(1000) }
    it "should convert the change amount to dollars" do
      expect(dollars).to eql "10.00"
    end
  end

end
