Rails.application.routes.draw do
   
   root "restaurants#index" #將首頁指向RestaurantsController的index action

   namespace :admin do
     root "restaurants#index" 
   end

end
