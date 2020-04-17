class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.integer :quantity
      t.string :telephone
      t.text :commentary
      t.references :user
      t.timestamps
    end
  end
end
