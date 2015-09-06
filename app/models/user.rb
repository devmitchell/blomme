class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :reported_issues, class_name: 'Issue', foreign_key: 'owner_id'
  has_and_belongs_to_many :issues_voted_for, class_name: 'Issue'

  def can_acknowledge_issue?(issue)
    self.admin?
  end

  def can_manage_issue?(issue)
    (self == issue.andand.owner) || self.admin?
  end
end
