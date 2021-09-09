class DropMeasurements < ActiveRecord::Migration[6.1]
  def up
    drop_table :measurements
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
