class UsersController < ApplicationController
  def new
  end

  def create
  	 name = params[:user][:name]
  	 username = params[:user][:username]
  	 password = params[:user][:password]
  	 department = params[:user][:department]
  	 division = params[:user][:division]
  	 conn = ActiveRecord::Base.connection
  	 sql = "insert into users_view (name,username,password,department,division) " +
  	 	 "values ('" + name + "','" + username + "','" + password + "','" + 
  	 	 department + "','" + division + "')"
  	 conn.insert(sql)
  	 redirect_to :controller => "users", :action => "index"
  end
  
  def edit
  	 @user = User.find(params[:id])
  end

  def index
  	 @users = User.all
  end
  
  def chooseUser
  	 @users = User.all
  end
  
  def update
    @user = User.find(params[:user][:id])
    if @user.update_attributes(:name => params[:user][:name],
      :username => params[:user][:username],
      :department => params[:user][:department],
      :division => params[:user][:division])
      redirect_to :controller => "users", :action => "index"
    else
      render :action => "edit"
    end
  end

end
