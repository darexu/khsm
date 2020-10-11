# Как и в любом тесте, подключаем помощник rspec-rails
require 'rails_helper'

RSpec.feature "A user is looking at another user's profile", type: :feature do

  let(:user) {  FactoryBot.create :user, name: 'Юра' }
  let(:another_user) {  FactoryBot.create :user, name: 'Влад' }

  let!(:games) do
    [
      FactoryBot.create(:game_with_questions, user: user, created_at: '2020.10.06, 10:00',
                        finished_at: '2020.10.06, 10:10', current_level: 2, is_failed: true,
                        prize: 27000),
      FactoryBot.create(:game_with_questions, user: user, created_at: '2020.10.02, 10:00',
                        finished_at: '2020.10.06, 10:10', current_level: 16, is_failed: false,
                        prize: 1000000),
      FactoryBot.create(:game_with_questions, user: user, created_at: '2020.10.03, 12:00',
                        finished_at: '2020.10.03, 10:10', current_level: 1, is_failed: true,
                        prize: 0)
    ]
  end

  before(:each) do
    login_as another_user
  end

  scenario 'successfully' do
    visit '/'

    click_link 'Юра'

    expect(page).not_to have_content('Сменить имя и пароль')

    expect(page).to have_content('1')
    expect(page).to have_content('проигрыш')
    expect(page).to have_content('06 окт., 10:00')
    expect(page).to have_content('27 000 ₽')

    expect(page).to have_content('2')
    expect(page).to have_content('проигрыш')
    expect(page).to have_content('03 окт., 12:00')
    expect(page).to have_content('0 ₽')

    expect(page).to have_content('3')
    expect(page).to have_content('победа')
    expect(page).to have_content('02 окт., 10:00')
    expect(page).to have_content('16')
    expect(page).to have_content('1 000 000 ₽')
    # В процессе работы можно использовать
    # save_and_open_page
    # но в конечном коде (который вы кладете в репозиторий)
    # этого кода быть не должно, также, как и byebug
  end
end
