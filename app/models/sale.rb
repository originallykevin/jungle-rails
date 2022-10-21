class Sale < ApplicationRecord

  # AR scope
  def self.active
    where("sales.starts_date <= ? AND sales.ends_on >= ?",
      Date.current, Date.current)
  end

  def finished?
    self.ends_on < Date.current
  end

  def upcoming?
    self.starts_date > Date.current
  end

  def active?
    !upcoming? && !finished?
  end
end
