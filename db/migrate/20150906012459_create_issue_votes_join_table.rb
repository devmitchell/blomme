class CreateIssueVotesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :issues, :users do |t|
      t.index :issue_id
      t.index :user_id
    end
  end
end
