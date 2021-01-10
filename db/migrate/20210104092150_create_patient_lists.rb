class CreatePatientLists < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_lists do |t|
      t.references  :patient,      null: false, foreign_key: true
      t.string :list
      t.timestamps
    end
  end
end
