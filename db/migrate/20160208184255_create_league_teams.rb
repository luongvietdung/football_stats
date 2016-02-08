class CreateLeagueTeams < ActiveRecord::Migration
  def change
    create_table :league_teams do |t|
      t.references :teams, index: true
      t.references :league_seasons, index: true
      t.string :team_code, unique: true
      t.timestamps null: false
    end
  end
end
