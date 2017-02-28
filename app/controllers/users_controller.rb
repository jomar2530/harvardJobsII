class UsersController < ApplicationController
  def new
  end

  def index
    if current_user
      redirect_to applicants_path
    else
      render "index"
    end
 
  end

  def create
   @user = User.where("email = ? AND password = ?", params[:email], params[:password])
    if @user.empty?
      flash.now.alert = "Invalid Email or Password"
      render "index"
    else
      @user.each do |userexist|
        session[:user_id] = userexist.id
      end
      @check_Existing_Ip_Address = Visitor.where("ip_address = ?", cookies[:company_ip])
      @check_Existing_Ip_Address.each do |existingIp|
        updateVisitor = Visitor.update(existingIp.id, :email => current_user.email, :company => current_user.company, :name => current_user.name)
        updateVisitorLogs = VisitorTimeLog.where("ip_address = ?", cookies[:company_ip]).update(:email => current_user.email, :company => current_user.company, :name => current_user.name)
      end
      redirect_to applicants_path
    end
  end 


  def destroy
      session[:user_id] = nil
      redirect_to users_path
  end
end
