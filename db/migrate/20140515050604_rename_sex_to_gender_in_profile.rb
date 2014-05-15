class RenameSexToGenderInProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :sex, :gender
  end
end
