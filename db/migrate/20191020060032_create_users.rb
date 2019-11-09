class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.integer :contact_num
      t.string :city
      t.string :email
      t.string :password_digest

      t.timestamps

    end
  end
end