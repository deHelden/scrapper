Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "hello#choise"
  get '/ria' => "hello#index"
  get '/lady' => "hello#second_index"
  get '/log' => "hello#log"

end
