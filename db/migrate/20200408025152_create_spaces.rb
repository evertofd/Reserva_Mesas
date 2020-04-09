class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :url
      t.string :slug

      t.timestamps
    end
  end
end
