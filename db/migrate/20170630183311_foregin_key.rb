class ForeginKey < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :product_id, :uuid
    add_foreign_key :reviews, :products
  end
end
