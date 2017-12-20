class CreateTeamUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :team_user_roles do |t|
      t.references :team, null: false, index: true
      t.references :user, null: false, index: true
      t.references :team_role, null: false, index: true

      t.timestamps
    end
  end
end
