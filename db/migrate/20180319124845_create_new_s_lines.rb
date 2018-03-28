class CreateNewSLines < ActiveRecord::Migration[5.1]
  def change
    create_table :new_s_lines do |t|
      t.string :url
      t.string :title
      t.string :time
      t.string :date

      t.timestamps
    end
  end
end
