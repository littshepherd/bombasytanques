class CreateAhorros < ActiveRecord::Migration[7.0]
  def change
    create_table :ahorros do |t|
      t.string :nombre_ahorro
      t.decimal :valor
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
