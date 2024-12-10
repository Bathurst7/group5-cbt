class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
