class AccessController < ApplicationController
  skip_authorization_check
    def dashboard
     @user = User.all
    end

    def type_rol
      @user = User.find(params[:id])
      if @user.admin?
        @user.visit!
      else
        @user.admin!
    end
    redirect_to access_dashboard_path
  end


    def destroy

      @user = User.find(params[:id])
      @user.destroy

      redirect_to access_dashboard_path
    end
end
