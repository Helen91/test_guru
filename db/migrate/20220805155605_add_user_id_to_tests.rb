class AddUserIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :tests, :user
  end
end
