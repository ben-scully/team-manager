class UserInitial < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string, null: false, default: ''
    add_column :users, :lastname, :string, null: false, default: ''
    add_column :users, :phone, :string, null: false, default: ''
    add_column :users, :dob, :datetime
    add_column :users, :status, :integer, default: 0, null: false
  end
end
