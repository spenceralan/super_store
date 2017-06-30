class Reviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews, id: :uuid do |t|
      t.string :username
      t.string :content 
      t.integer :rating

      t.timestamps
    end
  end
end
