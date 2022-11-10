class CreateRefundRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :refund_requests do |t|
      t.string :concept
      t.string :state
      t.references :movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
