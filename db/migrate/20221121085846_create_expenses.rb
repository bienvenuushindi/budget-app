class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount
      t.datetime :created_at
      t.references :user, null: false, foreign_key: true
    end
  end
end
