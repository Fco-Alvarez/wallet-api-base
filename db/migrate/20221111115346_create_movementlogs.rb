class CreateMovementlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :movementlogs do |t|
      t.decimal :amount
      t.string :kind
      t.belongs_to :movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
