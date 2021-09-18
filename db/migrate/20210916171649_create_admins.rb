class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :login
      t.string :password_digest

    end
    add_index :admins, :login, unique: true
  end
end
