class RecordsController < ApplicationController
  def top
  end

  def index  
  	  @records = Record.all
      @record = Record.new
  end

  def create
  	record = Record.new(record_params)
    record.save
    redirect_to record_path(record.id), notice: 'Book was successfully created.'
  end

  def edit
  	  @record = Record.find(params[:id])
  end

  def update
  	  record = Record.find(params[:id])
  	  record.update(record_params)
  	  redirect_to record_path(record.id), notice: 'Book was successfully update.'
  end


  def show
  	  @record = Record.find(params[:id])
  end

  def destroy
      record = Record.find(params[:id])
      record.destroy
      redirect_to records_path
  end

    private

    def record_params
    	params.require(:record).permit(:title, :body)
    end	
end
