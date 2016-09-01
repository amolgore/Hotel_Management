Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # Defining the root path for the user_dashboard

    get 'userDashboard' => 'home#user_dashboard' , as: :user_dashboard

    get 'Availability' => 'home#seat_availability', as: :seat_availability
    get 'BookRooms' => 'home#book_rooms', as: :book_rooms
    get 'available-rooms' => 'home#search_available_rooms', as: :search_available_rooms
    post 'book-room' => 'home#booked_room', as: :booked_room

  # Else index page will be the dashboard for non-logged in user
  root 'home#index'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
        confirmations: 'users/confirmations',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        sessions: 'users/sessions'
    }
  end

end
