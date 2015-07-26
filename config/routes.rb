Studiocracy::Application.routes.draw do
  root "pages#home"
  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations' }

  resources :posts, :has_many => [:comments, :post_votes]
  resources :post_votes

  resources :comments, :has_many =>[:comment_votes]
  resources  :comment_votes

  resources :charges
  resources :users

  resources :mailboxer_conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  get "/about", to: "pages#about", as: "about"
  get "/privacy", to: "pages#privacy", as: "privacy"
  get "/terms", to: "pages#terms", as: "terms"
  get "/our_team", to: "pages#our_team", as: "our_team"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"

  namespace :admin do
    resources :posts
    root "base#index"
    resources :users
    get "posts/drafts", to: "posts#drafts", as: "posts_drafts"
    get "posts/dashboard", to: "posts#dashboard", as: "posts_dashboard"
  end

end
