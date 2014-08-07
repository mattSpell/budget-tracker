class CreateActual < ActiveRecord::Migration
  def change
    create_table :actual do |t|
      t.string :category
      t.string :type
      t.integer :amount_to_debit_or_credit
      t.references :goal
    end
  end
end
