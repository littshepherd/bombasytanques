class PagoSeguridadSocial < ApplicationRecord
  belongs_to :user
  belongs_to :persona
end
