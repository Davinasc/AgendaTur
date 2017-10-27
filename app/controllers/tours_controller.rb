class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :update, :destroy]
  before_action :set_tour2, only: [:route, :guide]

  # GET /tours
  def index
    @tours = Tour.all

    render json: @tours
  end

  # GET /tours/1
  def show
    render json: @tour
  end

  # POST /tours
  def create
    @tour = Tour.new(tour_params)
    
    if @tour.save
      render json: @tour, status: :created, location: @tour
    else
      render json: @tour.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @tour.update(tour_params)
      render json: @tour
    else
      render json: @tour.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tours/1
  def destroy
    @tour.destroy
  end

  def route
    render json: @tour2.route
  end

  def guide
    render json: @tour2.user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    def set_tour2
      @tour2 = Tour.find(params[:tour_id])
    end

    # Only allow a trusted parameter "white list" through.
    def tour_params
      params.require(:tour).permit(:date, :vacancies, :arrival_time, :departure_time, :route_id, :user_id)
    end
end
