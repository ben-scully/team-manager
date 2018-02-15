class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.references :squad, null: false

      t.string :name, null: false
      t.column :status, :integer, default: 0, null: false

      t.timestamps
    end
  end
end
