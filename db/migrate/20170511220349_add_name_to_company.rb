class AddNameToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :name, :string
  end
end
