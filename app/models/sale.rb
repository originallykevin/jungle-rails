class Sale < ApplicationRecord

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
