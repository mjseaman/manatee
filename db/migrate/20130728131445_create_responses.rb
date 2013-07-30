class CreateResponses < ActiveRecord::Migration
  def change
  	create_table :responses do |t|
  		t.belongs_to :input
  		t.text :body
  		t.timestamps
  	end
  end
end
