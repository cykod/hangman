class InitialModels < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :word
      t.string :solved
      t.timestamps
    end
    
    create_table :guesses do |t|
      t.string :letter
      t.boolean :matches, default: false
      t.integer :game_id
    end

    add_index :guesses, :game_id
  end

end
