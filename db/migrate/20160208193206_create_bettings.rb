class CreateBettings < ActiveRecord::Migration
  def change
    create_table :bettings do |t|
      t.integer :total_match, default: 0
      t.integer :win, default: 0
      t.integer :draw, default: 0
      t.integer :lost, default: 0
      t.integer :offset, default: 0
      t.integer :over, default: 0
      t.decimal :ratio, precision: 5, scale: 2
      t.references :league_teams, index: true
      t.string :team_code, unique: true
      t.timestamps null: false
    end
  end
end
