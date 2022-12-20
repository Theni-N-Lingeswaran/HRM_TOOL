class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|

      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
