class Message
  include Mongoid::Document

  belongs_to :user
  field :text
  field :posted_on, type: Time
  has_many :likes, class_name: 'User'
end
