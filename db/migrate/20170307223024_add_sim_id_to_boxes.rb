class AddSimIdToBoxes < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :sim_id, :string
  end
end
