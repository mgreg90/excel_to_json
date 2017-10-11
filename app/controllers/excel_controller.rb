class ExcelController < ApplicationController

  def new
    @excel = Excel.new
  end

  def show
    @excel = Excel.find_by(id: params[:id])
    unless valid_id?(params[:id]) && @excel
      flash[:alert] = "There's no excel file with that id!"
      redirect_to new_excel_path
    end
  end

  def create
    @excel = Excel.create_from_file(excel_params)
    if @excel
      redirect_to excel_path(@excel.id)
    else
      flash[:alert] = "You failed to supply or supplied an invalid excel file!"
      redirect_to new_excel_path
    end
  end
  
  private
  
  def excel_params
    {file: params.dig(:excel, :excel_file).try(:tempfile)}
  end

end
