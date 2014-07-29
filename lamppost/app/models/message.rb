class Message < ActiveRecord::Base
  belongs_to :user
  
#TODO KAS Figure out how to have a user create a message
  validates :text, presence: true
  validates_length_of :text, :maximum => 400
end
