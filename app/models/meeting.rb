# frozen_string_literal: true

class Meeting < ApplicationRecord
  before_save :set_finished_at

  has_one_attached :preview_image

  validates :title, :description, :address, :started_at, :duration,
            presence: true

  def set_finished_at
    self.finished_at = started_at + duration.minutes
  end
end
