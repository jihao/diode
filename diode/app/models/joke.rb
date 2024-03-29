class Joke < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags
  
  default_scope :order => 'created_at DESC'
  
    # Return microposts from the users being followed by the given user.
    scope :from_users_followed_by, lambda { |user| followed_by(user) }

    private
      # Return an SQL condition for users followed by the given user.
      # We include the user's own id as well.
      def self.followed_by(user)
        # following_ids = user.following.map(&:id)
        #following_ids = user.following_ids
        following_ids = %(SELECT followed_id FROM relationships
                                WHERE follower_id = :user_id)
        where("user_id IN (#{following_ids}) OR user_id = :user_id",
              { :user_id => user })
      end
end
