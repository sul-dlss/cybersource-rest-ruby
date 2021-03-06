# frozen_string_literal: true

require_relative '../helpers/year_or_prev_year'
require 'config'
Config.load_and_set_settings(Config.setting_files('config', ENV['STAGE']))

# module to write a csv file to a directory
module WriteToCsv
  def self.file(data)
    return unless data

    d = Date.today
    date_stamp = Date.new(YearOrPrev.year, d.prev_month.month, 1).strftime('%Y%m')
    f = File.new("#{Settings.output_file_path}.#{date_stamp}", 'a+')
    data.each_line.with_index do |line, index|
      f.write(line) if index > 1
    end

    f.close
  end
end
