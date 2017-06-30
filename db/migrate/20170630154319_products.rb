class Products < ActiveRecord::Migration[5.1]
  def change
    enable_extension "pgcrypto"

    create_table :products, id: :uuid do |t|
      t.string :name
      t.decimal :price, precision: 12, scale: 2
      t.string :country

      t.timestamps
    end
  end
end
