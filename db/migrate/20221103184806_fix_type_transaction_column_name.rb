class FixTypeTransactionColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :type, :kind
  end
end
