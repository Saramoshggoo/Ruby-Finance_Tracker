class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks

  end
  def my_friends
    @friendship=current_user.friends
  end 
  def search
    if params[:friend].present?
      @friend = params[:friend]
      if @friend
          respond_to do |format|
              format.js {render partial:'users/friendresult'}
          end
      else 
          respond_to do |format|
          flash.now[:alert]="could not find user"
            format.js {render partial:'users/friendresult'}
          end
      end
      else
          respond_to do |format|
          flash.now[:alert]="please enter friend name or email to search"
          format.js {render partial:'users/friendresult'}
           end
      end
end
end
