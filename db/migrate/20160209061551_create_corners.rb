class CreateCorners < ActiveRecord::Migration
  def change
    create_table :corners do |t|
      t.integer :total_match, default: 0
      t.integer :win_match, default: 0
      t.integer :draw_match, default: 0
      t.integer :lost_match, default: 0
      t.integer :home, default: 0
      t.integer :guest, default: 0
      t.decimal :avg_home, precision: 5, scale: 2
      t.decimal :avg_guest, precision: 5, scale: 2
      t.decimal :avg_season, precision: 5, scale: 2
      t.references :league_teams, index: true
      t.string :team_code, unique: true
      t.references :m_phases, index: true
      t.timestamps null: false
    end
  end
end
