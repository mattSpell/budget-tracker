class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :amount
      t.references :banks
      t.references :actuals
    end
  end
end
