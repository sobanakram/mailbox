class AddTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :_type, :integer
  end
end
