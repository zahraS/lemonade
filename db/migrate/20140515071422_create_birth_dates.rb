class CreateBirthDates < ActiveRecord::Migration
  def change
    create_table :birth_dates do |t|
      t.datetime :date
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
