#!/usr/bin/ruby
# frozen_string_literal: true

require_relative '../CyberSource/download_payment_batch_detail_report'

date = ARGV[0]
result = DownloadPaymentBatchDetailReport.new(date)
result.main
