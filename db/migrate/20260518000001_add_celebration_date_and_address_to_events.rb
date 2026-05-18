class AddCelebrationDateAndAddressToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :celebration_date, :date
    add_column :events, :address, :string
  end
end
