class ChangeMessageUseridToInt < ActiveRecord::Migration
  def change
    change_column :messages, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
