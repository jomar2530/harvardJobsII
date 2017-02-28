class CreateDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :downloads do |t|
      t.string :email
      t.integer :resume
      t.integer :video
      t.string :company
      t.string :name

      t.timestamps
    end
  end
end
