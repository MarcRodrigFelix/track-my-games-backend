class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :is_completed, :boolean, :default => false
  end
end
