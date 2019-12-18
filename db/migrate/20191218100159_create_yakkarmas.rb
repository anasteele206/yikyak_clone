class CreateYakkarmas < ActiveRecord::Migration[6.0]
  def change
    create_table :yakkarmas do |t|
      t.integer :amount, default: 0, null: false
      t.belongs_to :user, null: false, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
