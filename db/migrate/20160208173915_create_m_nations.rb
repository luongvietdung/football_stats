class CreateMNations < ActiveRecord::Migration
  def change
    create_table :m_nations do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
