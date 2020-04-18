class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :st_name
      t.string :root
      t.integer :time

      t.timestamps
    end
  end
end
