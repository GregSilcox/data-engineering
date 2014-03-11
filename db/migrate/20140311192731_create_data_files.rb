class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
