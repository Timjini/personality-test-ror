Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Root 
  root "personality_test#index"

  get '/clear_session_and_cache', to: 'personality_test#clear_session_and_cache', as: 'clear_session_and_cache'

  # Finish screen Routes
  
  get '/personality-test', to: "personality_test#personality_test", as: :personality_test
  post '/personality-test/result', to: 'personality_test#result', as: 'personality_test_result'
  get '/personality-test/result', to: 'personality_test#completed', as: 'personality_test_result_get'
  patch '/personality-test/update_step', to: 'personality_test#update_step'

  
end
