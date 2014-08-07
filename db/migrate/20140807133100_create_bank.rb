class CreateBank < ActiveRecord::Migration
  def change
    create_table :bank do |t|
      t.integer :balance
      
    end
  end
end
