class CreateTeamEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :team_events do |t|
      t.references :team, null: false
      t.references :event, null: false

      t.timestamps
    end
  end
end
