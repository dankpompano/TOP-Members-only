class AddTopicAndBodyToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :topic, :string
    add_column :posts, :body, :text
  end
end
