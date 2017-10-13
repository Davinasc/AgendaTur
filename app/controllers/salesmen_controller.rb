class SalesmenController < UsersController

  # GET /salesmen
  def index
    @salesmen = User.where(user_type: :salesman)
    render json: @salesmen
  end

  # GET /salesmen/1
  def show
    @salesman = User.where(user_type: :salesman).find(params[:id])
    render json: @salesman
  end

end
