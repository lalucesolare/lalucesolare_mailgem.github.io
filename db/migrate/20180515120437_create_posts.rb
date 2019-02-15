class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :email
      t.text :content
      t.string :date
      
      t.timestamps null: false
    end
  end
end
