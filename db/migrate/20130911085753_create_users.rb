class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.text  :name
      t.text   :image

      t.timestamps
    end
  end
end
