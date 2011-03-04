# == Schema Information
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  created_on   :date
#  modified_on  :date
#  posters_name :text
#

# app/models/post.rb
class Post < ActiveRecord::Base
end
