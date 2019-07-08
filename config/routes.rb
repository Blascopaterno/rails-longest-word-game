Rails.application.routes.draw do
  get 'games/new', as: 'new'
  post 'games/score', as: 'score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
def generate_code(number)
  charset = Array('A'..'Z')
  Array.new(number) { charset.sample }
end
puts generate_code(20)
