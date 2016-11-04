class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.references :user, foreign_key: true
      t.references :requisition, foreign_key: true
      t.string :first_name
      t.string :second_name
      t.string :first_last_name
      t.string :second_last_name
      t.string :cell_phone_number

      t.timestamps
    end
  end
end
