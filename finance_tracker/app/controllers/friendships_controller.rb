class FriendshipsController < ApplicationController
    def create
        
              friend=User.findby(params[:id])
              @firendship=friendship.create(user:current_user,friend:friend)
              flash[:notice]="stock #{stock.name} was sucessfully added to your portfolio"
              redirect_to my_portfolio_path
        
    end
    def destroy
        puts current_user
        friendship =current_user.friendships.where(friend_id: params[:id]).first
        if friendship.present?
            friendship.destroy
            flash[:notice] = "Stopped following"

            redirect_to my_friends_path
        end
       
      
      end
end
