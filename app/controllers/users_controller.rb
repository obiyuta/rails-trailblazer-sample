class UsersController < ApplicationController
  def show
    run User::Show
  end
end
