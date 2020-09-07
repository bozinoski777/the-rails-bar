class AddDescriptionToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :description, :string
  end
end
