Rails.application.routes.draw do
  get 'game/game', to: 'game#game'

  get 'game/score', to: 'game#score'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
