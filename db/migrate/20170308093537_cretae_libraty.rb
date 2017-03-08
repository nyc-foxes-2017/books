class CretaeLibraty < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :address, null: false

      t.timestamps(null: false)
    end
  end
end
