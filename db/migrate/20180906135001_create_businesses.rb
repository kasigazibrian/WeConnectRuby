class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :business_email
      t.string :business_location
      t.string :contact_number
      t.string :business_description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
