class CreateActuals < ActiveRecord::Migration
  def change
    create_table :actuals do |t|
      t.string :name
      t.integer :amount
      t.belongs_to :goals
    end
  end
end
