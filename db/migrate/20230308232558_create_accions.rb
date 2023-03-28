class CreateAccions < ActiveRecord::Migration[7.0]
  def change
    create_table :accions do |t|
      t.string :tipo_accion

      t.timestamps
    end
  end
end
