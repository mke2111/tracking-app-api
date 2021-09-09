class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.integer :hours
      t.integer :memory
      t.references :users, null: false, foreign_key: true
      t.references :measures, null: false, foreign_key: true

      t.timestamps
    end
  end
end
