class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
