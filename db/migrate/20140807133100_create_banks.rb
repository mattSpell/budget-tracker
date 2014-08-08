class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.integer :balance

    end
  end
end
