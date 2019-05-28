class CreateMiniblogs < ActiveRecord::Migration[5.2]
  def change
    create_table :miniblogs do |t|
      t.text       :text
      t.timestamps null: true
    end
  end
end
