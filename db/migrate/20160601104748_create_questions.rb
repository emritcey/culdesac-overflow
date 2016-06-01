class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string :title
  		t.string :description
  		t.integer :user_id
  		t.integer :favorite_answer_id
  		t.integer :views_count

  		t.timestamps null: false
  	end
  end
end
