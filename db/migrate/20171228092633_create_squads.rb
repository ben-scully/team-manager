class CreateSquads < ActiveRecord::Migration[5.1]
  def change
    create_table :squads do |t|
      t.string :name, default: "", null: false

      t.timestamps
    end
  end
end
