class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :text
      t.decimal :lat, scale: 6, precision: 9
      t.decimal :long, scale: 6, precision: 9
      t.boolean :show_username, default: false, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
