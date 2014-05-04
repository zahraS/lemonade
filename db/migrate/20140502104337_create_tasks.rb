class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :done
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
