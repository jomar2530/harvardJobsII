class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.string :ip_address
      t.string :email
      t.integer :visits
      t.string :company
      t.string :name

      t.timestamps
    end
  end
end
