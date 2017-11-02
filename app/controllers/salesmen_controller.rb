class SalesmenController < UsersController

  # GET /salesmen
  def index
    @salesmen = User.where(user_type: :salesman)
    render json: @salesmen, root: :salesmen
  end

  # GET /salesmen/1
  def show
    @salesman = User.where(user_type: :salesman).find(params[:id])
    render json: @salesman, root: :salesman
  end

  def schedulings
    @guide = User.where(user_type: :salesman).find(params[:salesman_id])
    render json: @guide.schedulings, include: {client: [:all], tour: [:all]}
  end

end
