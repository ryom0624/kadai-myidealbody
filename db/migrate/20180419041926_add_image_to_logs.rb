class AddImageToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :image, :string
  end
end
