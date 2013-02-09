class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :location
      t.boolean :allow_event_scheduling
      t.boolean :allow_track_scheduling

      t.timestamps
    end
    add_index :events, :location_id
  end
end
