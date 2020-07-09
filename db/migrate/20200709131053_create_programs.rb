class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :amount
      t.references :user, null: false, foreign_key: true
      t.references :group, null: true, foreign_key: true

      t.timestamps
    end
  end
end
