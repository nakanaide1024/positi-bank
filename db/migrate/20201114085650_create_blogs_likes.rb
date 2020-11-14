class CreateBlogsLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
