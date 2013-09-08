class XCoder < ActiveRecord::Base
  attr_accessible :stream, :format_in, :format_out, :user_id
  belongs_to :user
  #default order, FIFO to schedule x-code task
  #default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  #stream name 
  validates :stream, presence: true
  #video i/o format name
  validates :format_in, presence: true, length: { maximum: 20 }
  validates :format_out, presence: true, length: { maximum: 20 }
end
