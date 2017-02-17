class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.string :location
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
