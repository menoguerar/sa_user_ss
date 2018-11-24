class Newsletter < ApplicationRecord
    has_many :newsletter_topics
    has_many :topics, through: :newsletter_topics

    after_commit :alert_user, on: :create
   
  
    private
    def alert_user
    end
end
