class CreateGarageLists < ActiveRecord::Migration[5.2]
  def change
    create_table :garage_lists do |t|
      t.string :title
      t.boolean :all_complete, default: false

      t.timestamps
    end
  end
end
