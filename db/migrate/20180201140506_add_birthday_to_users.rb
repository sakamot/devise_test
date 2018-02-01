class AddBirthdayToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthday, :date, after: :email
  end
end
