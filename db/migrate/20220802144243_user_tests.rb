class UserTests < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tests do |t|
      t.boolean :pass, default: false, null: false
      t.belongs_to :test, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
