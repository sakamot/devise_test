Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  post 'api/users/sign_up', to: 'api/users#sign_up'


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
