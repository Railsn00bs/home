class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :meetup_event_id
      t.string :name
      t.string :description
      t.datetime :start_at
      t.integer :duration
      t.string :venue_name
      t.string :status

      t.timestamps null: false
    end
  end
end
