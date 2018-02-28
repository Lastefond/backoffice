class AddCityToBox < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :city, :string
  end
end
