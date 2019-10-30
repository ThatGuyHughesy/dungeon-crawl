class CreateCharacterRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :character_races do |t|
      t.string :name
      t.string :description
      t.string :age
      t.string :alignment
      t.string :size
      t.string :speed
      t.string :languages

      t.timestamps
    end
  end
end
