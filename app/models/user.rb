class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  def can_acknowledge_issue?(issue)
    self.admin?
  end

  def can_manage_issue?(issue)
    (self == issue.andand.owner) || self.admin?
  end
end
