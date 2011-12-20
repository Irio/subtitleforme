class Subtitle < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  belongs_to :release
end
