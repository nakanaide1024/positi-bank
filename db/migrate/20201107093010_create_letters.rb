class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.text :thanks, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
