class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      t.references :task, foreign_key: true
      t.timestamp :started_at, null: false
      t.timestamp :ended_at, null: true
      t.timestamps
    end
  end
end
