class MsConvertersController < ApplicationController
  def index
    @ms_converters = MsConverter.all
  end

  def new
    @ms_converter = MsConverter.new
  end

  def create
    @ms_converter = MsConverter.new(ms_converter_params)

    if @ms_converter.save
      redirect_to @ms_converter, notice: "The sheet music #{@ms_converter.name}
       has been uploaded."
    else
      render 'new'
    end
  end

  def show
    @ms_converter = MsConverter.find(params[:id])
  end

  def destroy
    @ms_converter = MsConverter.find(params[:id])
    @ms_converter.destroy
    redirect_to @ms_converter, notice: "The sheet music #{@ms_converter.name}
     has been deleted."
  end

  private

  def ms_converter_params
    params.require(:ms_converter).permit(:name, :attachment)
  end
end
