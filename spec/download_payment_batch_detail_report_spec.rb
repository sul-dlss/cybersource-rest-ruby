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

    stub_request(:post, 'http://okapi:9130/authn/login')
      .with(body: { 'username' => 'username', 'password' => 'password' })

    stub_request(:get, "http://okapi:9130/accounts")
      .with(query: hash_including)
      .to_return(status: 200, body: '{
          "accounts": [
            {
              "amount": 35.0,
              "status": {
                "name": "Closed"
              },
              "feeFineType": "Lost item fee",
              "feeFineOwner": "SUL",
              "metadata": {
                "createdDate": "2023-10-10T09:33:55.532+00:00"
              },
              "userId": "f1cf56ef-5071-477f-b3ee-8779721a7f44",
              "feeFineId": "119611e6-2d66-4a83-b31f-f4026d9516ce",
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

  it 'finds the fee fine id stub' do
    account = {
              "amount"=>35.0,
              "status"=>{
                "name"=>"Closed"
              },
              "feeFineType"=>"Lost item fee",
              "feeFineOwner"=>"SUL",
              "userId"=>"f1cf56ef-5071-477f-b3ee-8779721a7f44",
              "feeFineId"=>"119611e6-2d66-4a83-b31f-f4026d9516ce",
              "id"=>"cf238f9f-7018-47b7-b815-bb2db798e19f"
            }
    fine_ids = '7ff7f3c:cf238f9:66a1dfd'
    expect(report.is_a_payment?(account, fine_ids)).to be true
  end
end
