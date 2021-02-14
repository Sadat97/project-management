class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.boolean :send_due_date_reminder, default: false
      t.integer :due_date_reminder_interval, default: 0
      t.time :due_date_reminder_time
      t.string :time_zone

      t.timestamps
    end
  end
end
