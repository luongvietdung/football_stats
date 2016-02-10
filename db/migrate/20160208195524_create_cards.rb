class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :total_match, default: 0
      t.integer :home_yellow, default: 0
      t.integer :guest_yellow, default: 0
      t.decimal :avg_yellow_per_match, precision: 5, scale: 2
      t.decimal :avg_yellow_home, precision: 5, scale: 2
      t.decimal :avg_yellow_guest, precision: 5, scale: 2
      t.integer :home_red, default: 0
      t.integer :guest_red, default: 0
      t.decimal :avg_red_per_match, precision: 5, scale: 2
      t.decimal :avg_red_home, precision: 5, scale: 2
      t.decimal :avg_red_guest, precision: 5, scale: 2
      t.references :league_teams, index: true
      t.string :team_code, unique: true
      t.timestamps null: false
    end
  end
end
