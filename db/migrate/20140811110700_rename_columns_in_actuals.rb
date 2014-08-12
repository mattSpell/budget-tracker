class RenameColumnsInActuals < ActiveRecord::Migration
  def change
    rename_column(:actuals, :goals_id, :goal_id)
  end
end
