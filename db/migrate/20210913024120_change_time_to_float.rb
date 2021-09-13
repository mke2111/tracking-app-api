class ChangeTimeToFloat < ActiveRecord::Migration[6.1]
  def up
    change_column :tasks, :time, 'float USING CAST(time AS float)'
  end

  def down
    change_column :tasks, :time, :string
  end
end
