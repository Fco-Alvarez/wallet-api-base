class FixTypeMovementColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :movements, :type, :kind
  end
end
