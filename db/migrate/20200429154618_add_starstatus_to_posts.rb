class AddStarstatusToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :star, :integer
  end
end
