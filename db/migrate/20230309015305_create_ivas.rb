class CreateIvas < ActiveRecord::Migration[7.0]
  def change
    create_table :ivas do |t|
      t.decimal :valor
      t.text :comentario
      t.references :accion, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
