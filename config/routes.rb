Rails.application.routes.draw do
  #root "main#index"
  get '/cities/view', to: 'cities#view'

  get '/cities/new', to: 'cities#new'
  post '/cities/view', to: 'cities#create'
  #get '/cities/create', to: redirect('/cities/view')


  get '/cities/update', to: 'cities#update'
  post '/cities/view', to: 'cities#update_city'

  get '/', to: redirect('/cities/view')
end
