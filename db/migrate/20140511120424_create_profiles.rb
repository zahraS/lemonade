class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :display_name
      t.string :sex
      t.datetime :birth_date
      t.string :country

      t.timestamps
    end
  end
end
