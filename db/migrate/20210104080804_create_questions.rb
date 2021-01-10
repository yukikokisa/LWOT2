class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :patient,                 null: false,    foreign_key: true
      t.integer  :consultation_content_id
      t.date     :date
      t.string   :subject
      t.text     :detail
      t.timestamps
    end
  end
end
