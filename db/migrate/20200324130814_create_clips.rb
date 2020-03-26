class CreateClips < ActiveRecord::Migration[5.0]
  def change
    create_table :clips do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
