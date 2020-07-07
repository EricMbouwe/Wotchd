class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.text :name, null: false
      t.integer :amount, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :programs, :name
  end
end
