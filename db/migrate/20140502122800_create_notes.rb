class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.boolean :private
      t.references :page, index: true

      t.timestamps
    end
  end
end
