class CreateShortLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :short_links do |t|
      t.string :url
      t.string :short_url_identifier
      t.references :user

      t.timestamps
    end
  end
end
