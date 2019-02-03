class CreateApiV1Teams < ActiveRecord::Migration[5.2]
  def change
    create_table :api_v1_teams do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
