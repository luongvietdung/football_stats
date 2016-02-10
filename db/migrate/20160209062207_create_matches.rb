class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :league_teams_home
      t.references :league_teams_guest
      t.string :team_code_home
      t.string :team_code_guest
      t.date :match_date
      t.integer :home_corners, default: 0
      t.integer :guest_corners, default: 0
      t.timestamps null: false
    end
  end
end
