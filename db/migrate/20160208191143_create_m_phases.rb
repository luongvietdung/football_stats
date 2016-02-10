class CreateMPhases < ActiveRecord::Migration
  def change
    create_table :m_phases do |t|
      t.string :key_name
      t.integer :type
      t.timestamps null: false
    end
  end
end
