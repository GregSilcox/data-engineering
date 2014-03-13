require 'spec_helper'

describe DataFile do
  describe "#parse" do
    it "returns true" do
      file = Rails.root.join "spec/factories/example_input.tab"
      test_file = DataFile.new data: File.open( file )
      expect( test_file.parse ).to be_true
      expect( test_file.total ).to be_present
      expect( test_file.total ).to eq 30.00
    end
  end
end
