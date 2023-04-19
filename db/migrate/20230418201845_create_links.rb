class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :identifier
      t.references :url, index: true

      t.timestamps
    end
  end
end
