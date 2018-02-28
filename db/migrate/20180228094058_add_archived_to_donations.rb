class AddArchivedToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :archived_at, :timestamp
    add_column :donators, :archived_at, :timestamp

    
  end
end
