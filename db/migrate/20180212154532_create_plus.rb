class CreatePlus < ActiveRecord::Migration[5.1]
  def change
    create_table :plus do |t|
      t.integer :user_id
      t.integer :skill_id
      t.timestamps

      t.index :user_id
      t.index :skill_id
      t.index [:user_id, :skill_id], unique: true
    end
  end
end
