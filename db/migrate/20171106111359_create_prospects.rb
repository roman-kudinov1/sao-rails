class CreateProspects < ActiveRecord::Migration[5.1]
  def change
    create_table :prospects do |t|
      t.integer :status
      t.string :name
      t.string :email
      t.string :mobile
      t.string :phone
      t.string :fax
      t.string :website
      t.text :other
      t.string :platform
      t.string :source_url
      t.integer :fetches
      t.datetime :last_fetch

      t.timestamps
    end
  end
end
