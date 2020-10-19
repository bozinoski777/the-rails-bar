require 'rails_helper'

RSpec.describe 'Homepage Index' do

  before(:context) do
    Cocktail.find(1).destroy! if Cocktail.where(id: 1).present?
    file = open('/home/hristian/Downloads/400046700953_8407.jpg')
    Cocktail.create!(name: 'Test Cocktail', id: '1', alcoholic: true).photo.attach(io: file, filename: 'img.png', content_type: 'image/png')
  end

  it 'Inputs search term and searches'

  it 'shows the relevant cocktail card on search'

  it 'shows the relevant cocktail name on card on search'

  it 'shows the relevant cocktail rating on card on search'

  it 'shows the relevant cocktail ingredients on card on search'

  it 'shows the relevant cocktail name on list item on search'

  it 'shows the relevant cocktail rating on list item on search'

  it 'shows the relevant cocktail ingredients on list item on search'

  it 'shows the relevant cocktail alcoholic/virgin on list item on search'

  it 'shows the relevant cocktail glass type on list item on search'


end
