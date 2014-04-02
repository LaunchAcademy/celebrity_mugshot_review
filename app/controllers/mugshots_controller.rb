class MugshotsController < ApplicationController
  def new
    @mugshot = Mugshot.new
  end

  def create
    @mugshot = Mugshot.new(mugshot_params)
    if @mugshot.save
      redirect_to mugshots_path(@mugshot),
        notice: "New Mugshot Submitted!"
    else
      render 'new'
    end
  end

  def index
    @mugshots = Mugshot.all
  end

  private
  def mugshot_params
    params.require(:mugshot).permit(:first_name, :last_name, :description, :approximate_date )
  end

end

