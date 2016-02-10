class CreateLeagueSeasonReferees < ActiveRecord::Migration
  def change
    create_table :league_season_referees do |t|
      t.references :referees, index: true
      t.references :league_seasons, index: true
      t.integer :total_match, default: 0
      t.integer :yellow, default: 0
      t.decimal :avg_yellow, precision: 5, scale: 2
      t.integer :red, default: 0
      t.decimal :ave_red, precision: 5, scale: 2
      t.decimal :pen, precision: 5, scale: 2
      t.decimal :foult, precision: 5, scale: 2
      t.string :name, unique: true
      t.timestamps null: false
    end
  end
end
