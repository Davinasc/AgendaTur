class GuidesController < UsersController

  # GET /guides
  def index
    @guides = User.where(user_type: :guide)
    render json: @guides
  end

  # GET /guides/1
  def show
    @guide = User.where(user_type: :guide).find(params[:id])
    render json: @guide
  end

  def tours
    @guide = User.where(user_type: :guide).find(params[:guide_id])
    render json: @guide.tours, include: {route: [:all]}
  end

end
