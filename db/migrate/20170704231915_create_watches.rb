class CreateWatches < ActiveRecord::Migration[5.1]
  def change
    create_table :watches do |t|
      t.references :user, foreign_key: true
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end
