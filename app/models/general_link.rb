class GeneralLink < ApplicationRecord
  belongs_to :entity
  before_save :check_archive_link

  def check_archive_link
    unless !!self.archive
      self.archive = "https://archive.is/" + self.href
    end
  end
end
