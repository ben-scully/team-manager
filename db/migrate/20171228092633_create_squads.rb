class CreateSquads < ActiveRecord::Migration[5.1]
  def change
    create_table :squads do |t|
      t.column :status, :integer, default: 0, null: false
      t.string :name, default: "", null: false

      t.timestamps
    end
  end
end
