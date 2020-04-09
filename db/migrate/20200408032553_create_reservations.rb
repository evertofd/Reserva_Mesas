class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|

      t.integer :quantity
      t.string :telephone
      t.text :commentary
      t.datetime :start_date
      t.datetime :end_date
      t.references :table

      t.timestamps
    end
  end
end
