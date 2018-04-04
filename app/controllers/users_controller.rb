class UsersController < ApplicationController
    
    load_and_authorize_resource
    
    def index
        if session[:profile] = "eventer"
            @users = User.joins(:profiles).where('profiles.name': 'eventer').page(params[:page])
        else
            @users = User.joins(:profiles).where('profiles.name': 'hoster').page(params[:page])
        end
    end
    
    def recreate
        u = User.create(user_params)
        u.profiles << Profile.eventer
        if params[:user] and params[:user][:country] and not params[:user][:country].blank?
            u.profiles << Profile.coord_country
        else
            u.profiles << Profile.coord_outside
        end
        u.password = 'sbabaji7'
        u.save!
        redirect_to users_path
    end
    
    def new
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        u = User.find(params[:id])
        if params[:user] and params[:user][:country].present?
            u.profiles << Profile.coord_country unless u.coord_country?
            u.profiles.destroy(Profile.coord_outside) if u.coord_outside?
        else
            u.profiles << Profile.coord_outside unless u.coord_outside?
            u.profiles.destroy(Profile.coord_country) if u.coord_country?
        end
        u.update_attributes(user_params)
        redirect_to users_path
    end
    
    def destroy
        User.find(params[:id]).destroy
        redirect_to users_path
    end
    
    def reset_password
        User.find(params[:id]).update_attribute(:password, 'sbabaji7')
        flash[:notice] = "Contraseña reiniciada exitosamente"
        redirect_to users_path
    end
    
    private
    def user_params
      params.require(:user).permit(:name, :surname, :password, :country, :email)
    end
end