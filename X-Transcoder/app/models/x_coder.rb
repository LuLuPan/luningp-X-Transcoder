class XCoder < ActiveRecord::Base
  attr_accessible :format, :stream, :user_id
  belongs_to :user
  #default order, FIFO to schedule x-code task
  #default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  #stream name 
  validates :stream, presence: true
  #video format name
  validates :format, presence: true, length: { maximum: 20 }
end
