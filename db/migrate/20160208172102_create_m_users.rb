class CreateMUsers < ActiveRecord::Migration
  def change
    create_table :m_users do |t|
      t.string :user_name, unique: true
      t.string :name
      t.integer :role
      t.timestamps null: false
    end
  end
end
