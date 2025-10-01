# frozen_string_literal: true

require "spec_helper"

RSpec.describe NeppanClient::Plans::Client do
  let(:sc_account) do
    double("ScAccount",
           url: "https://api.neppan.com",
           sc_system_id: "test_system",
           sc_user_id: "test_user",
           sc_password: "test_password")
  end

  let(:client) { described_class.new(sc_account) }

  describe "#call" do
    let(:test_date) { DateTime.new(2023, 1, 1, 12, 0, 0) }
    
    let(:success_response) do
      {
        "PlanResponse" => {
          "ResultInformation" => { "ResultCode" => "0" },
          "PlanList" => []
        }
      }
    end

    before do
      allow(DateTime).to receive(:now).and_return(test_date)
      
      # Match any POST request to the endpoint since XML formatting may vary
      stub_request(:post, "https://api.neppan.com/test_system/GetPlanOTA.php")
        .to_return(status: 200, body: success_response.to_json, headers: { 'Content-Type' => 'application/json' })
    end

    it "makes a successful API call" do
      result = client.call
      expect(result).to eq(success_response)
    end

    context "when API returns an error" do
      let(:error_response) do
        {
          "PlanResponse" => {
            "ResultInformation" => { "ResultCode" => "1" },
            "ErrorMessage" => "Invalid credentials"
          }
        }
      end

      before do
        stub_request(:post, "https://api.neppan.com/test_system/GetPlanOTA.php")
          .to_return(status: 200, body: error_response.to_json, headers: { 'Content-Type' => 'application/json' })
      end

      it "raises ResponseError" do
        expect { client.call }.to raise_error(NeppanClient::ResponseError)
      end
    end
  end

  describe "#root" do
    it "returns correct root element" do
      expect(client.root).to eq('PlanRequest')
    end
  end

  describe "#url_path" do
    it "returns correct URL path" do
      expect(client.url_path).to eq('GetPlanOTA.php')
    end
  end
end
