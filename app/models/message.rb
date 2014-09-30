class Message < ActiveRecord::Base
  attr_accessible :content, :conversation_id, :user_id
end
