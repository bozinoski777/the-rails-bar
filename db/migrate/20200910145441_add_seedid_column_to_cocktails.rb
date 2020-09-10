class AddSeedidColumnToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :seed_id, :string
  end
end
