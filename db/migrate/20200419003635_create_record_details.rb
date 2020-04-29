class CreateRecordDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :record_details do |t|
      t.string :sleep
      t.string :work
      t.string :exercise
      t.string :leisure
      t.references :user, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
