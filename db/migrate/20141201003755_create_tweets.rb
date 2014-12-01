class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
    	t.string :username, :content
    	t.float :longitude, :latitude

      t.timestamps
    end
  end
end
