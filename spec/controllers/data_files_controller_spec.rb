require 'spec_helper'

describe DataFilesController do
  describe "GET #index"do
    it "succeeds" do
      get :index
      expect( response ).to be_success
      expect( response.status ).to eq 200
    end
  end
end
