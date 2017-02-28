class CreateVisitorTimeLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :visitor_time_logs do |t|
      t.string :ip_address
      t.string :email
      t.string :company
      t.string :name

      t.timestamps
    end
  end
end
