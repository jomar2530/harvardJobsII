class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password, default: "", null:false
      t.string :company
      t.string :name
      t.integer :user_type, default: 0,  null: false

      t.timestamps
    end
  end
end
