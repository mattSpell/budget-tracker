require 'active_record'
class RenameColumnsInGoals < ActiveRecord::Migration
  def change
    rename_column(:goals, :banks_id, :bank_id)
    rename_column(:goals, :actuals_id, :actual_id)
  end
end
