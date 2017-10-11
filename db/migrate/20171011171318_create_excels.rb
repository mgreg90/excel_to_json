class CreateExcels < ActiveRecord::Migration[5.1]
  def change
    create_table :excels do |t|
      t.json :result_json

      t.timestamps
    end
  end
end
