class TopicSerializer < ActiveModel::Serializer
  attributes :id , :name, :img_id
  has_many :users, through: :user_topics
  has_many :newsletters, through: :newsletter_topics
end
