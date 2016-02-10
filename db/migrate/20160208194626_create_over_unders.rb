class CreateOverUnders < ActiveRecord::Migration
  def change
    create_table :over_unders do |t|
      t.integer :total_match, default: 0
      t.integer :over, default: 0
      t.integer :under, default: 0
      t.references :league_teams, index: true
      t.string :team_code, unique: true
      t.timestamps null: false
    end
  end
end
