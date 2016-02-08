class CreateLiveTables < ActiveRecord::Migration
  def change
    create_table :live_tables do |t|
      t.integer :total_match, default: 0
      t.integer :win_match, default: 0
      t.integer :draw_match, default: 0
      t.integer :lost_match, default: 0
      t.integer :goal, default: 0
      t.integer :lost, default: 0
      t.integer :offset, default: 0
      t.integer :point, default: 0
      t.references :league_teams, index: true
      t.string :team_code, unique: true
      t.references :m_phases, index: true
      t.timestamps null: false
    end
  end
end
