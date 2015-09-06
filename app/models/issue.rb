class Issue < ActiveRecord::Base
  PRIORITY_LEVELS = (1..6).to_a

  belongs_to :owner, class_name: 'User'
  belongs_to :closer, class_name: 'User'

  has_and_belongs_to_many :voters, class_name: 'User'

  scope :opened, -> { where(closer_id: nil) }
  scope :closed, -> { where.not(closer_id: nil) }

  validates :statement, presence: true
  validates :priority, inclusion: {in: PRIORITY_LEVELS}
end
