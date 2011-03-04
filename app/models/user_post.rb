# == Schema Information
#
# Table name: user_post_view
#
#  userid      :integer
#  postid      :integer
#  created_on  :date
#  modified_on :date
#

# app/models/user_post.rb
class UserPost < ActiveRecord::Base
	set_table_name "user_post_view"
end
