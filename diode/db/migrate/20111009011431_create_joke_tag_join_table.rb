class CreateJokeTagJoinTable < ActiveRecord::Migration
  def change
    #Creating Join Tables for has_and_belongs_to_many Associations
    create_table :jokes_tags, :id => false do |t|
      t.integer :joke_id
      t.integer :tag_id
    end
  end
end
