class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
