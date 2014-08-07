class CreateGoal < ActiveRecord::Migration
  def change
    create_table :goal do |t|
      t.string :category
      t.integer :goal_amount
      t.references :bank
    end
  end
end
