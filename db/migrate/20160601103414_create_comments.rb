class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :description
      t.integer :user_id
      t.integer :commentable_id
      t.string  :commentable_type

      t.timestamps(null: false)
    end
  end
end
