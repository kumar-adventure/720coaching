class Video < ActiveRecord::Base
  
  attr_accessible :file, :user_id, :title, :file_file_name
  belongs_to :user
  has_attached_file :file, :default_url => "/images/:style/missing.png"
end
