class CreateDeployments < ActiveRecord::Migration[6.0]
  def change
    create_table :deployments do |t|
      t.string :build_url
      t.boolean :success
      t.integer :duration
      t.belongs_to :environment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
