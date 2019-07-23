class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.float :official_value
      t.float :custom_value
      t.date :date

      t.timestamps
    end
  end
end
