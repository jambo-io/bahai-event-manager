class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :host_name

      t.timestamps
    end
  end
end
