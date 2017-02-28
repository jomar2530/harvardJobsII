class CreateDownloadTimeLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :download_time_logs do |t|
      t.string :email
      t.string :status
      t.string :company
      t.string :name

      t.timestamps
    end
  end
end
