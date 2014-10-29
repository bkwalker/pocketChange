class AddBasicFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :boolean
    add_column :users, :dob, :date
  end
end
