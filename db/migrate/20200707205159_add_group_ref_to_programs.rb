class AddGroupRefToPrograms < ActiveRecord::Migration[6.0]
  def change
    add_reference :programs, :group, null: true, foreign_key: true
  end
end
