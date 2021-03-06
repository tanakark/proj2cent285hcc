# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :text
#  username   :text
#  password   :text
#  enc_pass   :text
#  department :text
#  division   :text
#  salt       :text
#

# app/models/user.rb
class User < ActiveRecord::Base
  attr_accessible :name, :username, :department, :division
end
