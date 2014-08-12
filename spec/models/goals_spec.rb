RSpec.describe Goal do
  it { should belong_to :bank }
  it { should have_many :actuals }
  it { should validate_presence_of :name }
  it { should validate_presence_of :amount }
end
