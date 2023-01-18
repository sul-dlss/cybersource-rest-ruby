# frozen_string_literal: true

# module to return the current year or the previous year as needed
module YearOrPrev
  def self.year(date)
    date.month == 1 ? date.prev_year.year : date.year
  end
end
