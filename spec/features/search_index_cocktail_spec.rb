require 'rails_helper'

RSpec.describe 'Homepage Index' do
  before(:context) do
    Cocktail.find(1).destroy! if Cocktail.where(id: 1).present?
    file = open('/home/hristian/Downloads/400046700953_8407.jpg')
    Cocktail.create!(name: 'Test Cocktail', id: '1', alcoholic: true).photo.attach(io: file, filename: 'img.png', content_type: 'image/png')
  end

  it 'Inputs search term and searches' do
    visit('/')
    within('form#search_from') do
      fill_in 'query', with: 'Test Cocktail'
      find('input[name="alcoholic"]').click
      find('input[value="Search"]').click
      status_code == 200
    end
  end
end
