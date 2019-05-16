class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.text :description
      t.integer :age
      t.integer :rate
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
