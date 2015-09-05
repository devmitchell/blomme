class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.belongs_to :owner, index: true
      t.belongs_to :closer, index: true
      t.string :statement
      t.string :priority
      t.integer :votes, null: false, default: 0
      t.boolean :acknowledged
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
