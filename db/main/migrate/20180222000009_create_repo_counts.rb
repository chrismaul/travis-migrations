class CreateRepoCounts < ActiveRecord::Migration
  def up
    create_table :repo_counts, id: false do |t|
      t.belongs_to :repository, null: false
      t.integer :requests
      t.integer :commits
      t.integer :branches
      t.integer :pull_requests
      t.integer :tags
      t.integer :builds
      t.integer :stages
      t.integer :jobs
      t.string :range
    end

    add_index :repo_counts, :repository_id
  end

  def down
    drop_table :repo_counts rescue nil
  end
end