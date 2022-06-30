class AddPetsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string "name"
      t.string "animal_type"
      t.string "breed"
      t.string "adoption_status"
      t.string "comments"

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end