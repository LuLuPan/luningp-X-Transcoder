class XCoder < ActiveRecord::Base
  attr_accessible :format, :stream, :user_id
  validates_presence_of :stream
  belongs_to :user
end
