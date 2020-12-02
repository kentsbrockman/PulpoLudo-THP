class Game < ApplicationRecord

  belongs_to :game_sheet

  enum statuses: {in_stock: "en stock", leased: "en location", waiting_to_be_send: "en attente d'envoi", in_transit_send: "livraison aller", in_transit_back: "livraison retour", lost: "perdu", sold: "vendu"}
  enum conditions: {like_new: "comme neuf", excellent: "excellent", fine: "correct", damaged: "abimé", incomplete: "incomplet", broken: "detruit"}
  
  validates :stock_id,
            presence: true
            #format: {with: [0-9]{1,6}_[0-9]{1,3}}

  validates :statuses,
            presence: true,
            inclusion: {in: statuses.keys}

  validates :conditions,
            presence: true,
            inclusion: {in: conditions.keys}

  validates :weight,
            numericality: {greater_than_or_equal_to: 0}

  validates :height,
            numericality: {greater_than_or_equal_to: 0}

  validates :length,
            numericality: {greater_than_or_equal_to: 0}

  validates :width,
            numericality: {greater_than_or_equal_to: 0}

  validates :nb_times_rent,
            numericality: { only_integer: true, greater_than_or_equal_to: 0}
end