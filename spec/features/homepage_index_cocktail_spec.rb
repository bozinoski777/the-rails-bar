require 'rails_helper'

RSpec.describe 'Homepage Index' do

  before(:context) do
    Cocktail.find(1).destroy! if Cocktail.where(id: 1).present?
    file = open('/home/hristian/Downloads/400046700953_8407.jpg')
    Cocktail.create!(name: 'Test Cocktail', id: '1', alcoholic: true).photo.attach(io: file, filename: 'img.png', content_type: 'image/png')
  end

  it 'shows the cocktail card'

  it 'shows the cocktail name on card'

  it 'shows the cocktail rating on card'

  it 'shows the cocktail ingredients on card'

  it 'navigates to list view'

  it 'shows the cocktail name on list item'

  it 'shows the cocktail rating on list item'

  it 'shows the cocktail ingredients on list item'

  it 'shows the cocktail alcoholic/virgin on list item'

  it 'shows the cocktail glass type on list item'


end
