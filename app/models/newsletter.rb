class Newsletter < ActiveRecord::Base
  has_many :announcements
  has_many :moderators
  belongs_to :organization
end
