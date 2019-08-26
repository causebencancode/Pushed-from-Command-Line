class AddTopicTitleToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :topic_title, :string
  end
end
