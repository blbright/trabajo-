class AddCurrentPositionToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_position, :string
  end
end
