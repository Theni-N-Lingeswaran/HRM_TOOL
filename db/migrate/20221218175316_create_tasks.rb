class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, limit: 1000
      t.text :description
      t.boolean :status, default: false
      t.integer :priority, default: 0
      t.boolean :delist, default: false
      t.references :user, foreign_key: true, index: true
      t.string :token, limit: 50
      t.timestamps
    end
  end
end
