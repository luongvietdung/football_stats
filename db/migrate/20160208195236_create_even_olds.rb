class CreateEvenOlds < ActiveRecord::Migration
  def change
    create_table :even_olds do |t|
      t.integer :total_match, default: 0
      t.integer :even, default: 0
      t.integer :old, default: 0
      t.decimal :old_ratio, precision: 5, scale: 2
      t.decimal :even_ratio, precision: 5, scale: 2
      t.references :league_teams, index: true
      t.string :team_code, unique: true
      t.timestamps null: false
    end
  end
end
