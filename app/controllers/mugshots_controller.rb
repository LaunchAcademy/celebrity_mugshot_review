class MugshotsController < ApplicationController
  def new
    @mugshot = Mugshot.new
  end

  def create
    @mugshot = Mugshot.new(mugshot_params)
    if @mugshot.save
      redirect_to mugshot_path(@mugshot),
        notice: "New Mugshot Submitted!"
    else
      render 'new'
    end
  end

  def show
    @mugshot = Mugshot.find(params[:id])
  end

  def index
    @mugshots = Mugshot.all
  end

  protected
  def mugshot_params
    params.require(:mugshot).permit(:first_name, :last_name, :description, :approximate_date )
  end
end

