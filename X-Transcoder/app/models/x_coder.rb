class XCoder < ActiveRecord::Base
  attr_accessible :format, :stream, :user_id
  belongs_to :user
end
