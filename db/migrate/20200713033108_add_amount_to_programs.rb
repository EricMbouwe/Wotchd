class AddAmountToPrograms < ActiveRecord::Migration[6.0]
  def change
    add_column :programs, :amount, :integer
  end
end
