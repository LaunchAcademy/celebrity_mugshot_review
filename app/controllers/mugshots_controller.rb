class MugshotsController < ApplicationController
  def new
    @mugshot = Mugshot.new
  end

  def create
    @mugshot = Mugshot.new(mugshot_params)
    if @mugshot.save
      redirect_to mugshots_path, notice: "New Mugshot Submitted!"
    else
      render 'new'
    end
  end
end
