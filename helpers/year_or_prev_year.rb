# frozen_string_literal: true

# module to return the current year or the previous year as needed
module YearOrPrev
  def self.year
    d = Date.today
    d.month == 1 ? d.prev_year.year : d.year
  end
end
