require 'rails_helper'

RSpec.describe 'Edit cocktail' do
  before(:context) do
    Cocktail.find(1).destroy if Cocktail.where(id: 1).present?
    file = open('/home/hristian/Downloads/400046700953_8407.jpg')
    Cocktail.create(name: 'Test Cocktail', description: "bla", id: '1', alcoholic: true).photo.attach(io: file, filename: 'img.png', content_type: 'image/png')
    Dose.create(description: 'Gin', cocktail_id: '1', ingredient_id: '1')
    Ingredient.create(name: 'Milk')
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

  it 'edits cocktail picture' do
    visit('/cocktails/1')
    old_img = have_css(id: 'main_img')
    click_button('Edit Photo')
    find('form input[type="file"]').set('/home/hristian/Downloads/20200706_204644.jpg')
    click_button('Update Photo')
    expect(old_img).not_to eql have_css(id: 'main_img')
  end

  it 'adds an ingredient / dose' do
    visit('/cocktails/1')
    find('a[data-target="#exampleModalIngredient"]').click
    select('Milk', from: 'Ingredient')
    fill_in 'Description ', with: 'TestDose'
    click_button('Create Dose')
    expect(page).to have_content('TestDose')
  end

  it 'adds a rating' do
    visit('/cocktails/1')
    choose('one')
    click_button('Create Rating')
    choose('two')
    click_button('Create Rating')
    expect(page).to have_content('1.5')
  end

  it 'deletes an ingredient / dose' do
    visit('/cocktails/1')
    # find('a[data-target="#exampleModalIngredient"]').click
    # select('Milk', from: 'Ingredient')
    # fill_in 'Description ', with: 'TestDose'
    # click_button('Create Dose')
    expect(page).to have_content('TestDose')
    click_link('Delete')
    expect(page).not_to have_content('TestDose')
  end

  it 'deletes a cocktail' do
    visit('/cocktails/1')
    find('a[data-method="delete"]').click
    expect(current_path).to eql('/cocktails')
  end
end
