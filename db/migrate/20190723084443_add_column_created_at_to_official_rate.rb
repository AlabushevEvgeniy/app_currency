class AddColumnCreatedAtToOfficialRate < ActiveRecord::Migration[5.2]
  def change
    add_column :official_rates, :created_at, :datetime
  end
end
