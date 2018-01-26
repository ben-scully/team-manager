class CreateSquadMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :squad_members do |t|
      t.references :squad, null: false
      t.references :user, null: false

      t.column :status, :integer, default: 0, null: false

      t.timestamps
    end
  end
end
