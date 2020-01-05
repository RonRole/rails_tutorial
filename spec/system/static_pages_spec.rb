require 'rails_helper'


describe '静的なページのテスト', type: :system do
    let(:home_title) {'Ruby on Rails Tutorial Sample App' }
    let(:about_title) {"About | #{home_title}"}
    let(:contact_title) {"Contact | #{home_title}"}
    let(:help_title) {"Help | #{home_title}"}
    let(:signup_title) {"Sign up | #{home_title}"}

    describe 'コンテンツ確認' do
        it 'should get home' do
            visit home_path
            expect(page).to have_content("Home")
            expect(page.title).to eq(home_title)
        end

        it 'should get help' do
            visit help_path
            expect(page).to have_content("Help")
            expect(page.title).to eq(help_title)
        end

        it 'should get about' do
            visit about_path
            expect(page).to have_content("About")
            expect(page.title).to eq(about_title)
        end

        it 'root should be home' do
            visit root_path
            expect(page).to have_content("Home")
        end

        it 'should get contact' do
            visit contact_path
            expect(page).to have_content("Contact")
            expect(page.title).to eq(contact_title)
        end

        it 'should get signup' do
            visit signup_path
            expect(page).to have_content("Sign up")
            expect(page.title).to eq(signup_title)
        end
    end

    describe 'リンク確認' do
        describe 'header links' do
            before(:each) do
                visit root_path
            end

            it 'click home_link then home_page' do
                click_link('Home')
                sleep 1
                expect(page.title).to eq(home_title)
            end

            it 'click help_link then help_page' do
                click_link('Help')
                sleep 1
                expect(page.title).to eq(help_title)
            end

            it 'click login_link then login_page' do
                click_link('Sign up')
                sleep 1 
                expect(page.title).to eq(signup_title)
            end
        end

        describe 'footer links' do
            before(:each) do
                visit root_path
            end

            it 'click about_link then about_page' do
                click_link('About')
                sleep 1 #画面が変わるまで待つ
                expect(page.title).to eq(about_title)
            end

            it 'click contact_link then contact_page' do
                click_link('Contact')
                sleep 1 #画面が変わるまで待つ
                expect(page.title).to eq(contact_title)
            end
        end
    end
end