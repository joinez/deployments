class CreateEnvironments < ActiveRecord::Migration[6.0]
  def change
    create_table :environments do |t|
      t.string :name
      t.belongs_to :cloud, null: false, foreign_key: true

      t.timestamps
    end
  end
end
