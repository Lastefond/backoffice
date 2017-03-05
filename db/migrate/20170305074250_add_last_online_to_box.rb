class AddLastOnlineToBox < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :last_online, :timestamp
  end
end
