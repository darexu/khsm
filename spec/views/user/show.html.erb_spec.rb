require 'rails_helper'

# Тест на шаблон users/show.html.erb

RSpec.describe 'users/show', type: :view do
  context 'viewed by current user' do
    before(:each) do
      current_user = FactoryBot.create(:user, name: 'Юра')
      assign(:user, current_user)
      sign_in current_user

      render
    end

    it 'render player name' do
      expect(rendered).to match 'Юра'
    end

    it 'render game partial' do
      assign(:games, [FactoryBot.build_stubbed(:game)])
      stub_template 'users/_game.html.erb' => "User game goes here"

      render
      expect(rendered).to match "User game goes here"
    end

    it 'render change name and password link' do
      expect(rendered).to match 'Сменить имя и пароль'
    end
  end

  context 'viewed by another user' do
    before(:each) do
      assign(:user, FactoryBot.create(:user, name: 'Юра'))

      render
    end

    it "doesn't render change name and password link" do
      expect(rendered).not_to match 'Сменить имя и пароль'
    end

    it 'render player name' do
      expect(rendered).to match 'Юра'
    end

    it 'render game partial' do
      assign(:games, [FactoryBot.build_stubbed(:game)])
      stub_template 'users/_game.html.erb' => "User game goes here"

      render
      expect(rendered).to match "User game goes here"
    end
  end
end
