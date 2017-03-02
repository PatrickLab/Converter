# MuseScore Controller
# * This controller offer facilities to
# * easily upload and manage partitions
# * written in MuseScore format
class MsConvertersController < ApplicationController

  # Returns all the MuseScore converters
  def index
    @converter_ms_all = MsConverter.all
  end

  # Creates a new MuseScore converter
  def new
    @converter_ms = MsConverter.new
  end

  # Creates  a new MuseScore converter with parameters
  def create
    @converter_ms = MsConverter.new(ms_converter_params)

    if @converter_ms.save
      redirect_to @converter_ms, notice: "The sheet music #{@converter_ms.name}
       has been uploaded."
    else
      render 'new'
    end
  end

  # Returns the selected MuseScore converter
  def show
    @converter_ms = MsConverter.find(params[:id])
  end

  # Deletes the selected MuseScore converter
  def destroy
    @converter_ms = MsConverter.find(params[:id])
    @converter_ms.destroy
    redirect_to @converter_ms, notice: "The sheet music #{@converter_ms.name}
     has been deleted."
  end

  private

  def ms_converter_params
    params.require(:ms_converter).permit(:name, :attachment)
  end
end
