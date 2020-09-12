class AddGlassToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :glass, :string
  end
end
