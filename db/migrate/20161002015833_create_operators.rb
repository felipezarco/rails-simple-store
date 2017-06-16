class CreateOperators < ActiveRecord::Migration[5.0]
  def change
    create_table :operators do |t|
      t.belongs_to :department, index: true
      t.string :name

      t.timestamps
    end
  end
end
