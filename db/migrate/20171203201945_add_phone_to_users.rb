class AddPhoneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string, null: false, default: ''
    add_column :users, :dob, :datetime
  end
end
