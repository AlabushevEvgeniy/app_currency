class CreateOfficialRates < ActiveRecord::Migration[5.2]
  def change
    create_table :official_rates do |t|
      t.float :value
    end
  end
end
