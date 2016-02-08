class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :type, default: 0
      t.references :m_nations, index: true
      t.timestamps null: false
    end
  end
end
