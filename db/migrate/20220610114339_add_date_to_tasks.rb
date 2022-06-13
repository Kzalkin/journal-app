class AddDateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :date, :date
  end
end
