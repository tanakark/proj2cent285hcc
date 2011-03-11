class UserPostController < ApplicationController
  def index
	 @userposts = UserPost.all
  end
  
  def findByPost
  	 @userposts = UserPost.find_all_by_posters_name(params[:posters_name])
  end
  
  def new
  end
  
  def create
    userid = cookies.signed[:user_id].to_s
    suggestion = params[:user_post][:suggestion]
    conn = ActiveRecord::Base.connection
    sql = "insert into posts (userid, suggestion,created_at,updated_at) " +
      "values ('" + userid + "','" + suggestion + "', now(),now())"
    conn.insert(sql)
    redirect_to :controller => "user_post", :action => "index"
  end
  
  def update
    @user = User.find(params[:user_post][:suggestion])
    if @user.update_attributes(:suggestion => params[:user_post][:suggestion],
      :suggestion => params[:user_post][:suggestion])
      redirect_to :controller => "user_post", :action => "index"
    else
      render :action => "edit"
    end
  end
  

  

end
