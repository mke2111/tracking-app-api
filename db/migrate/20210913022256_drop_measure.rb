class DropMeasure < ActiveRecord::Migration[6.1]
  def up
    drop_table :measures
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
