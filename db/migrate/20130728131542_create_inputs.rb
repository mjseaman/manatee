class CreateInputs < ActiveRecord::Migration
  def change
  	create_table :inputs do |t|
  		t.string :body, unique: true
  	end
  end
end
