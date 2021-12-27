# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :level
      t.text :ingred
      t.text :descrip
      t.integer :time
      t.string :image

      t.timestamps
    end
  end
end
