# frozen_string_literal: true

require 'spec_helper'
require_relative '../helpers/year_or_prev_year'
require_relative '../CyberSource/download_payment_batch_detail_report'

RSpec.describe DownloadPaymentBatchDetailReport do
  let(:result) { described_class }
  let(:download_report) { File.open(File.join(Dir.pwd, 'spec', 'fixtures', 'report_file.csv')).read }
  let(:dstring) { Date.today.to_s }
  let(:d) { Date.parse(dstring) }
  let(:date_stamp) { Date.new(YearOrPrev.year, d.prev_month.month, 1).strftime('%Y%m') }
  let(:file) { File.join(Dir.pwd, 'spec', 'fixtures', "report_cyberfile.#{date_stamp}") }

  before do
    File.open(file, 'a+')
    allow_any_instance_of(result).to receive(:download_report).and_return(download_report)
    result.new(dstring).main
  end

  after do
    File.delete(file) if File.exist?(file)
  end

  it 'downloads reports for the entire month' do
    puts "Opening file: #{file}\n"
    expect(IO.readlines(file).size).to be >= 28
  end

  it 'contains a csv file of details about the transactions' do
    puts "Opening file: #{file}\n"
    IO.foreach(file) do |row|
      expect(row.split(',').size).to eq 13
    end
  end
end
