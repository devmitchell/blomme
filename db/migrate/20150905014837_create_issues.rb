class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.belongs_to :owner, index: true
      t.belongs_to :closer, index: true
      t.string :statement
      t.integer :priority, null: false
      t.boolean :acknowledged, default: false
      t.boolean :closed, default: false

      t.timestamps null: false
    end
  end
end
