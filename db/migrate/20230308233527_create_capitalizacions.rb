class CreateCapitalizacions < ActiveRecord::Migration[7.0]
  def change
    create_table :capitalizacions do |t|
      t.decimal :cantidad
      t.text :comentario
      t.references :accion, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
