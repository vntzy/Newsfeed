class Message
  include Mongoid::Document

  belongs_to :user, inverse_of: :messages
  field :text
  field :posted_on, type: Time
  has_and_belongs_to_many :likes, class_name: 'User', inverse_of: :liked_messages
end
