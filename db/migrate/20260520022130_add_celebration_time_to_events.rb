class AddCelebrationTimeToEvents < ActiveRecord::Migration[8.1]
  def change
    add_column :events, :celebration_time, :time
  end
end
