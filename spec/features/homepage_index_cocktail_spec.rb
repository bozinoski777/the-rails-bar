require 'rails_helper'

RSpec.describe 'Homepage Index' do

  before(:context) do
    Cocktail.find(1).destroy! if Cocktail.where(id: 1).present?
    Dose.find(1).destroy! if Dose.where(id: 1).present?
    file = open('/home/hristian/Downloads/400046700953_8407.jpg')
    Cocktail.create!(name: 'Test Cocktail', id: 1, alcoholic: true).photo.attach(io: file, filename: 'img.png', content_type: 'image/png')
    Rating.create!(rating: 4, id: 1, cocktail_id: 1)
    Ingredient.create!(name: 'KUR_DEBEL', id: 1)
    Dose.create!(description: 'Gin', cocktail_id: 1, ingredient_id: 1)
  end

  it 'shows the cocktail card' do
    visit('/')
    find('div.card')
  end

  it 'shows the cocktail name on card' do
    visit('/')
    find('div.card_name')
  end

  it 'shows the cocktail rating on card' do
    visit('/')
    find('div.card_rating')
  end

  it 'shows the cocktail ingredients on card' do
    visit('/')
    find('div.card_ingredient')
  end

  it 'navigates to list view'

  it 'shows the cocktail name on list item'

  it 'shows the cocktail rating on list item'

  it 'shows the cocktail ingredients on list item'

  it 'shows the cocktail alcoholic/virgin on list item'

  it 'shows the cocktail glass type on list item'


end
