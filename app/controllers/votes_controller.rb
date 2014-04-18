class VotesController < ApplicationController

  def create

  mugshot = Mugshot.find(params[:mugshot_id])
  vote = mugshot.votes.build
  vote.user = current_user

  if Vote.exists?(mugshot_id: mugshot.id, user_id: current_user.id)
    vote.destroy
    redirect_to mugshot, notice: "You were bailed out"
  else
    vote.save
    redirect_to mugshot, notice: "You got voted"
  end

  end

end
