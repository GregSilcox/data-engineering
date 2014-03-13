require 'spec_helper'

describe DataFileUploader do
  it "stores as files" do
    expect( DataFileUploader.storage ).to eq CarrierWave::Storage::File
  end
end
