class CreateDonators < ActiveRecord::Migration[5.0]
  def change
    create_table :donators do |t|
      t.integer :box_id
      t.string :name

      t.timestamps
    end
  end
end
