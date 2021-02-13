class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.integer :send_due_date_reminder, limit: 1
      t.integer :due_date_reminder_interval
      t.time :due_date_reminder_time
      t.string :time_zone

      t.timestamps
    end
  end
end
