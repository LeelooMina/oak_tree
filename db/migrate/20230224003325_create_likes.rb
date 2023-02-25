class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :likes
    create_table :likes do |t|
      t.references :acorn, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    end
  end
end
