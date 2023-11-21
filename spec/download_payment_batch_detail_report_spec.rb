# frozen_string_literal: true

require 'spec_helper'
require_relative '../cyber_source/download_payment_batch_detail_report'

RSpec.describe DownloadPaymentBatchDetailReport do
  let(:dstring) { Date.today.to_s }
  let(:report) { described_class.new(dstring) }
  let(:file) { File.join(Dir.pwd, 'files/credits.csv') }
  let(:download_report) { File.read(File.join(Dir.pwd, 'spec', 'fixtures', 'report_file.csv')) }

  before do
    File.open(file, 'a+')

    stub_request(:post, 'http://example.com/authn/login')
      .with(body: { 'username' => 'username', 'password' => 'password' })

    stub_request(:get, "#{ENV['OKAPI_URL']}/accounts")
      .with(query: hash_including)
      .to_return(body: '{
          "accounts": [
            {
              "amount": 35.0,
              "paymentStatus": {
                "name": "Paid fully"
              },
              "feeFineType": "Lost item fee",
              "metadata": {
                "createdDate": "2023-10-10T09:33:55.532+00:00"
              },
              "userId": "f1cf56ef-5071-477f-b3ee-8779721a7f44",
              "id": "cf238f9f-7018-47b7-b815-bb2db798e19f"
            }
          ],
          "totalRecords": 1
        }')

    allow(report).to receive(:download_report).and_return(download_report)
    report.main
  end

  after do
    FileUtils.rm_f(file)
  end

  it 'creates a file of credits' do
    expect(File.readlines(file).size).to be >= 28
  end
end
