class ExcelController < ApplicationController

  def new
    @excel = Excel.new
  end

  def show
    @excel = Excel.find(params[:id])
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
