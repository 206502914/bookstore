Bookstore::Application.routes.draw do
  get "cart/index"
  get "cart/error"
  get "cart/first"
  get "books/login"
  get "books/prologin"

  resources :books

  get "home/index"


    root :to => 'home#index'
    
    match 'books/aboutus/:id' => 'books#aboutus'
    
    match 'books/list' => 'books#list'

   

end
