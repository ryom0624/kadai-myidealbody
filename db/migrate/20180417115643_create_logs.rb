class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.decimal :weight, precision: 5, scale: 2
      t.decimal :fat, precision: 3, scale: 1

      t.timestamps
    end
  end
end
