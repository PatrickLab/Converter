Rails.application.routes.draw do

  resources :ms_converters, only: [:index, :show, :new, :create, :destroy]

  get 'ms_converters/index'

  get 'ms_converters/new'

  get 'ms_converters/create'

  get 'ms_converters/destroy'

  get 'ms_converters/:id' => "ms_converters#show", :as => 'name'

  get "ms_converter/new" => "ms_converters#new"

  root "ms_converters#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
