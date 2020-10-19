require 'rails_helper'

RSpec.describe 'Edit cocktail' do

  before(:context) do
    Cocktail.find(1).destroy! if Cocktail.where(id: 1).present?
    file = open('/home/hristian/Downloads/400046700953_8407.jpg')
    Cocktail.create!(name: 'Test Cocktail', id: '1', alcoholic: true).photo.attach(io: file, filename: 'img.png', content_type: 'image/png')
  end

  it 'displays the cocktail page' do
    visit('/cocktails/1')
    expect(page).to have_content('Instructions')
  end

  it 'edits cocktail name' do
    visit('/cocktails/1')
    fill_in 'Name', with: 'TestName'
    click_button('Update Name')
    expect(page).to have_content('TestName')
  end

  it 'edits cocktail description' do
    visit('/cocktails/1')
    fill_in 'Description', with: 'TestDescription'
    click_button('Update Info')
    expect(page).to have_content('TestDescription')
  end

  it 'edits cocktail glass-type' do
    visit('/cocktails/1')
    fill_in 'Glass', with: 'TestGlass'
    click_button('Update Info')
    expect(page).to have_content('TestGlass')
  end

  it 'edits cocktail alcoholic' do
    visit('/cocktails/1')
    find("input[type='checkbox']").set(false)
    click_button('Update Info')
    expect(page).to have_content('Non-Alcoholic')
  end

  it 'edits cocktail picture'

  it 'adds an ingredient / dose'

  it 'deletes an ingredient / dose'

  it 'add a rating'

  it 'deletes a cocktail'


  # it 'creates a new cocktail' do
  #   visit('/cocktails/new')
  #   fill_in 'Name', with: 'TestCocktail'
  #   find('form input[type="file"]').set('/home/hristian/Downloads/20200706_204644.jpg')
  #   find('input[name="commit"]').click
  #   expect(page).to have_content('Well done!')
  # end
end
