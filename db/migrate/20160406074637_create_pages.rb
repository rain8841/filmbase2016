class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :short_name
      t.string :title
      t.string :meta_keywords
      t.string :meta_description
      t.text :content
      t.boolean :allow_user
      t.boolean :show
      t.integer :index

      t.timestamps null: false
    end
  end
end
