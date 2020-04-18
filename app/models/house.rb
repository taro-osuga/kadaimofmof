class House < ApplicationRecord
    has_many :stations, dependent: :destroy
    accepts_nested_attributes_for :stations, reject_if: :reject_both_blank, allow_destroy: true

    def reject_both_blank(attributes)
      attributes[:root].blank? and attributes[:st_name].blank? and attributes[:time].blank?
    end
end
