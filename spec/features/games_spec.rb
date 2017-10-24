require 'rails_helper'

RSpec.feature "Games", type: :feature, js: true do
  before do
    Game.delete_all
  end

  scenario "Create a game" do
    visit "/new"

    rocks    = page.all ".set-rock"
    scissors = page.all ".set-scissors"
    paper    = page.all ".set-paper"
    spock    = page.all ".set-spock"
    lizard   = page.all ".set-lizard"

    rocks[0].click
    scissors[1].click
    scissors[2].click
    spock[3].click
    scissors[4].click
    rocks[5].click
    paper[6].click
    paper[7].click
    scissors[8].click
    scissors[9].click

    click_button "Fight"

    expect(page).to have_text "Waiting for Adversary"
  end

  scenario "Join a game" do
    game = Game.new(moves_player_1: ["paper", "rock", "scissors", "scissors", "scissors", "scissors", "rock", "paper", "paper", "spock"])
    game.save!

    visit "/new"

    rocks    = page.all ".set-rock"
    scissors = page.all ".set-scissors"
    paper    = page.all ".set-paper"
    spock    = page.all ".set-spock"
    lizard   = page.all ".set-lizard"

    rocks[0].click
    scissors[1].click
    scissors[2].click
    spock[3].click
    scissors[4].click
    rocks[5].click
    paper[6].click
    paper[7].click
    scissors[8].click
    scissors[9].click

    fill_in "game-id", with: game.id
    click_button "Fight"

    expect(page).to have_text "Game Over"
  end
end