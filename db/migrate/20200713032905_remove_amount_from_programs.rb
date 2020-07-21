class RemoveAmountFromPrograms < ActiveRecord::Migration[6.0]
  def change
    remove_column :programs, :amount, :string
  end
end
