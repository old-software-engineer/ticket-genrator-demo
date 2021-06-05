class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :number
      t.date :due_date
      t.text :notes

      t.timestamps
    end
  end
end
