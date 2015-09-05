class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :statement
      t.boolean :acknowledged
      t.string :priority
      t.integer :votes, null: false, default: 0

      t.timestamps null: false
    end
  end
end
