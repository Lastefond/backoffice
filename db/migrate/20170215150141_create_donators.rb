class CreateDonators < ActiveRecord::Migration[5.0]
  def change
    create_table :donators do |t|
      t.integer :box_id
      t.string :name
      t.timestamp :received_at

      t.timestamps
    end
  end
end
