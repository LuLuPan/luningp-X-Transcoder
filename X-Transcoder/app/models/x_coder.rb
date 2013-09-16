class XCoder < ActiveRecord::Base
  attr_accessible :format, :stream, :user_id
  validates_presence_of :stream
  validates :user_id, presence: true
  belongs_to :user
  default_scope -> { order('created_at DESC') }
end
