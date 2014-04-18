class VotesController < ApplicationController
  def create
    mugshot = Mugshot.find(params[:mugshot_id])
    vote = mugshot.votes.build
    vote.user = current_user

    if vote.save
      flash[:notice] = "Stuff"
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy

    redirect_to :back
  end
end
