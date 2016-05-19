class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :location
      t.text :description

      t.timestamps null: false
    end
  end
end
