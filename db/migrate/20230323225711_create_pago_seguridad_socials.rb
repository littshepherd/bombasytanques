class CreatePagoSeguridadSocials < ActiveRecord::Migration[7.0]
  def change
    create_table :pago_seguridad_socials do |t|
      t.decimal :valor
      t.text :comentario
      t.references :user, null: false, foreign_key: true
      t.references :persona, null: false, foreign_key: {to_table: :users}, index: true

      t.timestamps
    end
  end
end
