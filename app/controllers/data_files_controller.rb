class DataFilesController < ApplicationController
  def show
    @total = params[ :id ]
  end

  def new
    @data_file = DataFile.new
  end

  def create
    @data_file = DataFile.new
    @data_file.data = params[ :data_file ][ :data ]

    if @data_file.parse
      flash[ :notice ] = "Successfully uploaded the data file!"
      render :show
    else
      flash[ :error ] = "Unable to upload the data file!"
      render :new
    end
  rescue Errno::ENOENT
    flash[ :error ] = "Unable to upload the data file!"
    render :new
  end

private

  def data_file_params
    params.require( :data_file ).permit( :data )
  end
end
