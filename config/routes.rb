Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :profile_groups, only: %i(index show create update destroy), path: 'profile-groups'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :pings, only: %i(create)
      resources :profile_groups, only: %i(index show create update destroy), path: 'profile-groups'
    end
  end
end
