class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :start
      t.integer :end
      t.timestamps null: false
    end
  end
end
