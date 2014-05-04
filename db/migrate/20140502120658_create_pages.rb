class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.datetime :published_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
