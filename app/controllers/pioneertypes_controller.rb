class PioneertypesController < ApplicationController

  def index
    @pioneertypes = Pioneertype.page(params[:page]).per(8)
  end

  def new
    @pioneertype = Pioneertype.new
    @pioneertype.pioneertype_images.new
  end

  def show
    @pioneertype = Pioneertype.find(params[:id])
  end

  def create
    Pioneertype.create(create_params)
    redirect_to root_path
  end

  private
  def create_params
    params.require(:pioneertype).permit(:title, :concept, :catchcopy, pioneertype_images_attributes: [:id, :image, :status, :pioneertype_id]).merge(user_id: current_user.id)
  end

end