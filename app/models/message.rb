class Message
  include Mongoid::Document
  belongs_to :user
  field :text
  field :posted_on, type: Time
  field :likes, type: Integer
end
