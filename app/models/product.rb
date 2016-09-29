class Product < ApplicationRecord


  def row_class
    "#{red_row_class} #{green_text_row_class}"
  end

  def red_row_class
    self.available.end_of_day > Time.zone.now.end_of_day ?
      'red-row' : ''
  end

  def green_text_row_class
    self.stock < 10 ? 'green-text-row' : ''
  end

end
