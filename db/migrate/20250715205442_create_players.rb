class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name, limit: 50
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
