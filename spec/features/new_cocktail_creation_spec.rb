require 'rails_helper'

RSpec.describe 'New Cocktail Creation' do
  it 'displays the welcome message of the app' do
    visit('/')
    expect(page).to have_content('Welcome to the Cocktail Creation App')
  end

  it 'opens new cocktail page' do
    visit('/')
    click_link('START HERE')
    expect(current_path).to eql('/cocktails/new')
  end

  it 'creates a new cocktail' do
    visit('/cocktails/new')
    fill_in 'Name', with: 'TestCocktail'
    find('form input[type="file"]').set('/home/hristian/Downloads/20200706_204644.jpg')
    find('input[name="commit"]').click
    expect(page).to have_content('Well done!')
  end
end
