class CreateRecordDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :record_details do |t|
      t.decimal :sleep, precision: 4, scale: 2
      t.decimal :work, precision: 4, scale: 2
      t.decimal :exercise, precision: 4, scale: 2
      t.decimal :leisure, precision: 4, scale: 2
      t.references :user, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
