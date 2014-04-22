class MugshotsController < ApplicationController
  def new
    @mugshot = Mugshot.new
  end

  def create
    @mugshot = current_user.mugshots.build(mugshot_params)

    if @mugshot.save
      redirect_to mugshot_path(@mugshot),
        notice: "New Mugshot Submitted!"
    else
      render 'new'
    end
  end

  def show
    @mugshot = Mugshot.find(params[:id])
    @mugshot_comments = @mugshot.comments
    @comment = Comment.new
  end

  def index
    @mugshots = Mugshot.order(:created_at).page params[:page]

  end

  def edit
    if current_user.mugshots.exists?(params[:id])
      @mugshot = current_user.mugshots.find(params[:id])
    else
      redirect_to mugshots_path, notice: 'Sorry, you cannot edit a post that you didn\'t create.'
    end
  end

  def update
    @mugshot = current_user.mugshots.find(params[:id])

    if @mugshot.update(mugshot_params)
      redirect_to mugshot_path(@mugshot), notice: 'Mugshot Updated'
    else
      render 'edit'
    end
  end

  def destroy
    @mugshot = current_user.mugshots.find(params[:id])
    @mugshot = Mugshot.find(params[:id])
    @mugshot.destroy
    redirect_to mugshots_path, notice: 'Mugshot deleted.'
  end

protected

  def mugshot_params
    params.require(:mugshot).permit(:first_name, :last_name, :description, :approximate_date, :image)
  end
end

