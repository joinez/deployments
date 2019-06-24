class CreateDeployments < ActiveRecord::Migration[6.0]
  def change
    create_table :deployments do |t|
      t.string :build_id
      t.datetime :started_at
      t.datetime :finished_at
      t.belongs_to :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
