class CreateApiV1Favorites < ActiveRecord::Migration[5.2]
  def change
    create_table :api_v1_favorites do |t|
      t.references :user
      t.references :team
      t.timestamps
    end
  end
end
