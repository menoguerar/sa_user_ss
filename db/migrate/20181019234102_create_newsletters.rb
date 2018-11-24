class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.string :title
      t.text :description
      t.string :url_to_image
      t.timestamps
    end
  end
end
