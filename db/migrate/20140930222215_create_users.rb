class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :picture
      t.string :password_digest
      t.decimal :rating
      t.boolean :active

      t.timestamps
    end
  end
end
