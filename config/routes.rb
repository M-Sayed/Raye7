# == Route Map
#
#               Prefix Verb   URI Pattern                                   Controller#Action
#            api_users POST   /api/users(.:format)                          api/v1/users#create
#             api_user GET    /api/users/:id(.:format)                      api/v1/users#show
#           api_groups GET    /api/groups(.:format)                         api/v1/groups#index
#                      POST   /api/groups(.:format)                         api/v1/groups#create
#            api_group GET    /api/groups/:id(.:format)                     api/v1/groups#show
#           api_places GET    /api/places(.:format)                         api/v1/places#index
#                      POST   /api/places(.:format)                         api/v1/places#create
#            api_place GET    /api/places/:id(.:format)                     api/v1/places#show
#           api_index1 GET    /api/index1(.:format)                         api/v1/trips#index
# api_trip_memberships POST   /api/trips/:trip_id/memberships(.:format)     api/v1/memberships#create
#  api_trip_membership DELETE /api/trips/:trip_id/memberships/:id(.:format) api/v1/memberships#destroy
#        api_trip_join POST   /api/trips/:trip_id/join(.:format)            api/v1/memberships#create
#       api_trip_leave DELETE /api/trips/:trip_id/leave(.:format)           api/v1/memberships#destroy
#            api_trips GET    /api/trips(.:format)                          api/v1/trips#index
#                      POST   /api/trips(.:format)                          api/v1/trips#create
#             api_trip GET    /api/trips/:id(.:format)                      api/v1/trips#show
#                      DELETE /api/trips/:id(.:format)                      api/v1/trips#destroy
#                      POST   /api/user(.:format)                           api/v1/users#create
#

require 'api_constraints'

Rails.application.routes.draw do
  # mount SabisuRails::Engine => "/sabisu_rails"
  namespace :api do # , defaults: { format: :json }, constraints: { subdomain: 'api'}, path: '/' do
    scope module: :v1 do # , constraints: ApiConstraints.new(version: 1, default: true) do

      resources :users, :only => [:show, :create]
      resources :groups, only: [:show, :index, :create]
      resources :places, only: [:show, :index, :create]
      
      resources :trips, only: [:index, :create, :show, :destroy] do
        resources :memberships, only: [:create, :destroy]
        post '/join' => 'memberships#create'
        delete '/leave' => 'memberships#destroy'
      end

      post '/user' => 'users#create'
    end
  end
end
