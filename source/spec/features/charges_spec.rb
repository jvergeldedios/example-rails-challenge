require 'spec_helper'
require 'seed'

describe 'charges index' do

  before { Seed.perform }

  it 'has 3 lists' do
    visit '/charges'
    expect(page).to have_css('ul.failed')
    expect(page).to have_css('ul.disputed')
    expect(page).to have_css('ul.successful')
  end

  it 'has 10 successful charges' do
    visit '/charges'
    expect(page).to have_css('ul.successful li.charge', count: 10)
  end

  it 'has 5 disputed charges' do
    visit '/charges'
    expect(page).to have_css('ul.disputed li.charge', count: 5)
  end

  it 'has 5 failed charges' do
    visit '/charges'
    expect(page).to have_css('ul.failed li.charge', count: 5)
  end
end