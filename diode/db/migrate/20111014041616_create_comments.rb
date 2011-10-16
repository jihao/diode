class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :joke
      t.references :user

      t.timestamps
    end
  end
end
