class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  def can_manage_issue?(issue)
    (self == issue.owner) || self.admin?
  end
end
