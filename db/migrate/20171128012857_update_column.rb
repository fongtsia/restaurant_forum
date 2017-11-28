class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :restaurants, :imges ,:image
  end
end
