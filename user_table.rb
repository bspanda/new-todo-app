require "./connect_db.rb"
connect_db!

ActiveRecord::Migration.create_table(:users) do |t|
  t.column :name, :string
  t.column :email, :string
  t.column :password, :string
end
