Roboto::Engine.routes.draw do
  get '/robots.txt' => 'Robots#show'
end

