class CreateRiaNews < ActiveRecord::Migration[5.1]
  def change
    create_table :ria_news do |t|
      t.string :url
      t.string :title
      t.string :time
      t.string :date

      t.timestamps
    end
  end
end
