class Accion < ApplicationRecord
  has_many :capitalizacions
  has_many :ivas
  has_many :ahorro_seguridad_socials
end
