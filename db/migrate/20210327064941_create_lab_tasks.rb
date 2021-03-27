class CreateLabTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :lab_tasks do |t|
      t.string :title
      t.string :description
      t.boolean :complete,default: false
      t.references :garage_list, foreign_key: true

      t.timestamps
    end
  end
end
