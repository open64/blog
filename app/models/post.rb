class Post < ActiveRecord::Base
	#validates_presence_of :title, :on => "", :message => "you don't enter title"
	validates :title, presence: true
end
