class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :name, limit: 50
      t.string :city

      t.timestamps
    end
  end
end
