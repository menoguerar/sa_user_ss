class NewsletterSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url_to_image
  has_many :topics, through: :newsletter_topics
end
