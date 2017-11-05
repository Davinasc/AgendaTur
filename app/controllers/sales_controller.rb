class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :update, :destroy]
  before_action :set_sale2, only: [:tour, :salesman, :clients]

  # GET /sales
  def index
    @sales = Sale.all

    render json: @sales
  end

  # GET /sales/1
  def show
    render json: @sale
  end

  # POST /sales
  def create
    @sale = Sale.new(sale_params[:sale])
    clients = sale_params[:clients]
    
    if @sale.save
      clients.each do |client|
        @client = Client.create(client)
        @sale.schedulings.create(client: @client)
      end

      render json: @sale, status: :created, location: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sales/1
  def update
    if @sale.update(sale_params)
      render json: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sales/1
  def destroy
    @sale.destroy
  end

  def tour
    render json: @sale2.tour
  end

  def salesman
    render json: @sale2.user, root: :salesman
  end

  def clients
    @clients = @sale2.clients
    render json: @clients
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def set_sale2
      @sale2 = Sale.find(params[:sale_id])
    end

    # Only allow a trusted parameter "white list" through.
    def sale_params
      sale_params = params.permit({sale: [:total_price, :receive_price, :voucher_price, :user_id, :tour_id]},
        {clients: [:name, :email, :phone, :hotel, :apartment, :adult]}
      )
      # sale_params.permit!
    end
end
