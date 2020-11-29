class AddTypeToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :_type, :integer, default: 0
  end
end
