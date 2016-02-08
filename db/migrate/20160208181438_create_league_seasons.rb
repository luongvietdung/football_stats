class CreateLeagueSeasons < ActiveRecord::Migration
  def change
    create_table :league_seasons do |t|
      t.references :leagues, index: true
      t.references :seasons, index: true
      t.timestamps null: false
    end
  end
end
