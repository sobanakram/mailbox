class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :user_name
      t.string :user_email
      t.string :subject
      t.text :content
      t.datetime :discarded_at, index: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
