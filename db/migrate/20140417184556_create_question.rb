class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body, :null => false
      t.integer :poll_id, :null => false

      t.timestamps
    end

    add_index :questions, :poll_id
    change_column :polls, :title, :string, :null => false
  end
end
