class CreateTeamRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :team_roles do |t|
      t.string :name, default: "", null: false
      
      t.timestamps
    end
  end
end
