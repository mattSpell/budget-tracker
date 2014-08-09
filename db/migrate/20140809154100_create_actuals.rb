class CreateActuals < ActiveRecord::Migration
  def change
    create_table :actuals do |t|
      t.string :name
      t.integer :amount
      t.references :goals
    end
  end
end
