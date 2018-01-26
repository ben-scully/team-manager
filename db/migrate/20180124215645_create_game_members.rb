class CreateGameMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :game_members do |t|
      t.references :game, null: false
      t.references :squad_member, null: false

      t.column :status, :integer, default: 0, null: false

      t.timestamps
    end
  end
end
