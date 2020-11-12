class Records < ActiveRecord::Migration[6.0]
  def change
    drop_table :counts
  end
end
