class CreateCustomRates < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_rates do |t|
      t.float :value
      t.date :date
    end
  end
end
