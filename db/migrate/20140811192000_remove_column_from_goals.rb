class RemoveColumnFromGoals < ActiveRecord::Migration
  def change
    remove_column(:goals, :actual_id)
  end
end
