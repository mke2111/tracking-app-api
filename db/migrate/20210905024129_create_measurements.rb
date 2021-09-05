class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.string :hours
      t.string :memory
      t.references :user, null: false, foreign_key: true
      t.references :measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
