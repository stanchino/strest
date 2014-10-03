class CreateApiRequests < ActiveRecord::Migration
  def change
    create_table :api_requests do |t|
      t.string :method
      t.string :host
      t.string :uri
      t.string :headers
      t.string :body

      t.timestamps
    end
  end
end
