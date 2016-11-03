class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :second_last_name
      t.string :first_last_name
      t.datetime :birth_date
      t.string :curp
      t.string :rfc
      t.string :gender
      t.string :birth_state
      t.integer :phone_number
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
