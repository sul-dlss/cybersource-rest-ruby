# frozen_string_literal: true
require 'byebug'
require_relative '../helpers/year_or_prev_year'
require 'config'
Config.load_and_set_settings(Config.setting_files('config', ENV.fetch('STAGE', nil)))

# module to write a csv file to a directory
module WriteToCsv
  def self.file(data, date)
    return unless data

    date_stamp = Date.new(date.year, date.month, 1).strftime('%Y%m')
    f = File.new("#{Settings.output_file_path}.#{date_stamp}", 'a+')
    data.each_line.with_index do |line, index|
      f.write(line) if index > 1
    end

    f.close
  end
end
