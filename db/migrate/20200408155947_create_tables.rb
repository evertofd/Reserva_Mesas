class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.integer :chair
      t.string :table_number
      t.boolean :available, default: true
      t.references :space, foreign_key: true

      t.timestamps
    end
  end
end
