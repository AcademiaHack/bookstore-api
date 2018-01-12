class AddApiKeyToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :api_key, :string
  end
end
