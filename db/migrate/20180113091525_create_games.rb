class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :squad, null: false

      t.string :name, default: "", null: false
      t.datetime :start, null: false

      t.timestamps
    end
  end
end
