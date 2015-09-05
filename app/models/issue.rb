class Issue < ActiveRecord::Base
  validates :statement, presence: true
end
