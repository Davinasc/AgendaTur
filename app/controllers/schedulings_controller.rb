class SchedulingsController < ApplicationController
  before_action :set_scheduling, only: [:show, :update, :destroy]
  before_action :set_scheduling2, only: [:tour, :salesman, :client]

  # GET /schedulings
  def index
    @schedulings = Scheduling.all

    render json: @schedulings
  end

  # GET /schedulings/1
  def show
    render json: @scheduling
  end

  # POST /schedulings
  def create
    @scheduling = Scheduling.new(scheduling_params)

      if @scheduling.save
        render json: @scheduling, status: :created, location: @scheduling
      else
        render json: @scheduling.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /schedulings/1
  def update
    if @scheduling.update(scheduling_params)
      render json: @scheduling
    else
      render json: @scheduling.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedulings/1
  def destroy
    @scheduling.destroy
  end

  def tour
    render json: @scheduling2.tour
  end

  def salesman
    render json: @scheduling2.user, root: :salesman
  end

  def client
    @client = @scheduling2.client
    render json: @client
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduling
      @scheduling = Scheduling.find(params[:id])
    end

    def set_scheduling2
      @scheduling2 = Scheduling.find(params[:scheduling_id])
    end

    # Only allow a trusted parameter "white list" through.
    def scheduling_params
      params.require(:scheduling).permit(:total_price, :receive_price, :voucher_price, :user_id, :tour_id, :client_id)
    end
end
