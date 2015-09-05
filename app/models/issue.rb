class Issue < ActiveRecord::Base
  PRIORITY_1 = 'CATASTROPHIC'
  PRIORITY_2 = 'URGENT'
  PRIORITY_3 = 'NEEDS ATTENTION'
  PRIORITY_4 = 'WHENEVER'
  PRIORITY_5 = 'MEH'
  PRIORITY_BRANDON = 'BRANDON TIME'
  PRIORITY_LEVELS = [PRIORITY_1, PRIORITY_2, PRIORITY_3, PRIORITY_4, PRIORITY_5, PRIORITY_BRANDON]

  belongs_to :owner, class_name: 'User'
  belongs_to :closer, class_name: 'User'

  scope :opened, -> { where(closer_id: nil) }
  scope :closed, -> { where.not(closer_id: nil) }

  validates :statement, presence: true
  validates :priority, inclusion: {in: PRIORITY_LEVELS}
end
