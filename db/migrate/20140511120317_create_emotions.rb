class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.references :page, index: true
      t.string :emotion_type

      t.timestamps
    end
  end
end
