class CreateDeploymentVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :deployment_versions do |t|
      t.string :version
      t.belongs_to :deployment, null: false, foreign_key: true
      t.belongs_to :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
