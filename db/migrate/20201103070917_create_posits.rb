class CreatePosits < ActiveRecord::Migration[6.0]
  def change
    create_table :posits do |t|
      t.string :posit, null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
