class CreateRequisitions < ActiveRecord::Migration[5.0]
  def change
    create_table :requisitions do |t|
      t.references :user, foreign_key: true      
			t.float :income
			t.integer :address_years
			t.integer :company_years
			t.string :marital_status
			t.float :requested_amount
			t.text :payment_terms
			t.string :bank
			t.text :comment
			t.string :company_name
			t.string :company_phone_number
			t.string :dependents_number
			t.string :company_position
			t.boolean :has_sgmm
			t.boolean :has_imss
			t.boolean :has_car

      t.timestamps
    end
  end
end
