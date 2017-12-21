class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :start, null: false
      t.string :location, null: false
      t.references :team_event, null: false

      t.timestamps
    end
  end
end
