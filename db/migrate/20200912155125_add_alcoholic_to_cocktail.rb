class AddAlcoholicToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :alcoholic, :boolean
  end
end
