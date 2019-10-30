class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :character_race, foreign_key: true
      t.references :character_class, foreign_key: true

      t.timestamps
    end
  end
end
