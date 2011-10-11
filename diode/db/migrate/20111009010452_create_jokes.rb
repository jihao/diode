class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.string :title
      t.text :content
      t.float :score
      t.boolean :visible
      t.boolean :disable_comments
      t.references :user

      t.timestamps
    end
    add_index :jokes, :user_id
  end
end
