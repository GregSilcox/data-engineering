require 'spec_helper'

describe DataFilesController do
  describe "Get #show" do
    it "succeeds" do
      get :show, id: "5.00"
      expect( response ).to be_success
      expect( response.status ).to eq 200
    end

    it "renders the show template" do
      get :show, id: "5.00"
      expect( response ).to render_template :show
    end
  end

  describe "GET #new" do
    it "succeeds" do
      get :new
      expect( response ).to be_success
      expect( response.status ).to eq 200
    end

    it "renders a template" do
      get :new
      expect( response ).to render_template :new
    end
  end

  describe "POST #create" do
    # This needs to be submitted from a multipart form.
    it "succeeds", :skip do
      file = File.open( "spec/factories/example_input.tab" )
      expect( file ).to be_a File
      data_file = DataFile.new data: file
      expect( data_file.data.current_path ).to be_a String
      post :create, data_file: { data: data_file.data.current_path }
      expect( response ).to be_success
      expect( response ).to render_template :show
      expect( flash[ :notice ] ).to eq "Successfully uploaded the data file!"
    end

    it "fails" do
      post :create, data_file: { data: "bad_data.tab" }
      expect( response ).to be_success
      expect( flash[ :error ] ).to eq "Unable to upload the data file!"
      expect( response ).to render_template :new
    end
  end
end
