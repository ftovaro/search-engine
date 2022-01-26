class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, default: ""
      t.string :description, default: ""
      t.string :author, default: ""

      t.timestamps
    end
  end
end
