class PlayerPassport < ApplicationRecord
  belongs_to :league
  belongs_to :player
  belongs_to :team
  has_many :player_predictions,:through => :player
  validates :player, uniqueness: { scope: :league }
end
