require 'rails_helper'

RSpec.describe 'Edit cocktail' do

  before(:context) do
    Cocktail.find(1).destroy! if Cocktail.where(id: 1).present?
    file = open('/home/hristian/Downloads/400046700953_8407.jpg')
    Cocktail.create!(name: 'Test Cocktail', id: '1').photo.attach(io: file, filename: 'img.png', content_type: 'image/png')
  end

  it 'displays the cocktail page' do
    visit('/cocktails/1')
    expect(page).to have_content('Instructions')
  end

  it 'opens edit cocktail name' do
    visit('/cocktails/1')
    fill_in 'Name', with: 'TestName'
    click_button('Update Cocktail')
    expect(page).to have_content('TestName')
  end

  # it 'creates a new cocktail' do
  #   visit('/cocktails/new')
  #   fill_in 'Name', with: 'TestCocktail'
  #   find('form input[type="file"]').set('/home/hristian/Downloads/20200706_204644.jpg')
  #   find('input[name="commit"]').click
  #   expect(page).to have_content('Well done!')
  # end
end
