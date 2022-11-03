class CreateFixedTermDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :fixed_term_deposits do |t|
      t.decimal :amount
      t.date :creation_date
      t.date :closing_date

      t.timestamps
    end
  end
end
