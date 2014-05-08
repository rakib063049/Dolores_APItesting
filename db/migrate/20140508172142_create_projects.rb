class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_number
      t.integer :customer_id
      t.integer :contact_id
      t.datetime :start_date
      t.datetime :end_date
      t.text :notes

      t.timestamps
    end
  end
end
