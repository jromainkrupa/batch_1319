class RenameColumnRatings < ActiveRecord::Migration[7.0]
  def change
    rename_column :restaurants, :rating, :ratings
  end
end