class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :series, null: false

      t.column :status, :integer, default: 0, null: false
      t.string :name, default: "", null: false
      t.datetime :start, null: false

      t.timestamps
    end
  end
end
