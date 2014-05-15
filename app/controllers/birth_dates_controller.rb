class BirthDatesController < ApplicationController
  before_action :set_birth_date, only: [:show, :edit, :update, :destroy]

  def index
    @birth_dates = BirthDate.all
    respond_with(@birth_dates)
  end

  def show
    respond_with(@birth_date)
  end

  def new
    @birth_date = BirthDate.new
    respond_with(@birth_date)
  end

  def edit
  end

  def create
    @birth_date = BirthDate.new(birth_date_params)
    @birth_date.save
    respond_with(@birth_date)
  end

  def update
    @birth_date.update(birth_date_params)
    respond_with(@birth_date)
  end

  def destroy
    @birth_date.destroy
    respond_with(@birth_date)
  end

  private
    def set_birth_date
      @birth_date = BirthDate.find(params[:id])
    end

    def birth_date_params
      params.require(:birth_date).permit(:date, :title, :user_id)
    end
end
