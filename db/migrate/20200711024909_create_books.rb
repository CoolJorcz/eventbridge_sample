class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, id: :uuid do |t|
      t.text :title
      t.string :author

      t.timestamps
    end
  end
end
