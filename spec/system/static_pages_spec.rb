require 'rails_helper'


describe '静的なページのテスト', type: :system do
    it 'should get home' do
        visit static_pages_home_path
        expect(page).to have_content("Home")
        expect(page.title).to eq("Ruby on Rails Tutorial Sample App")
    end

    it 'should get help' do
        visit static_pages_help_path
        expect(page).to have_content("Help")
        expect(page.title).to eq("Help | Ruby on Rails Tutorial Sample App")
    end

    it 'should get about' do
        visit static_pages_about_path
        expect(page).to have_content("About")
        expect(page.title).to eq("About | Ruby on Rails Tutorial Sample App")
    end

    it 'root should be home' do
        visit root_path
        expect(page).to have_content("Home")
    end
end