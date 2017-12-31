class CreateSquads < ActiveRecord::Migration[5.1]
  def change
    create_table :squads do |t|
      t.string :name, default: "", null: false

      t.timestamps
    end

    create_table :squads_users, id: false do |t|
      t.belongs_to :squad, index: true
      t.belongs_to :user, index: true
    end
  end
end
