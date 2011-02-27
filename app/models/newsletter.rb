class Newsletter < ActiveRecord::Base
  has_many :announcements
  belongs_to :organization
end
