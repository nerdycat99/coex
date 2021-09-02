class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.string :currency_code, limit: 5
      t.float :last
      t.float :bid
      t.float :ask
      t.timestamps
    end
  end
end
