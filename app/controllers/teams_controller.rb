class TeamsController < ApplicationController

  include TeamsHelper
  include ApplicationHelper

  def show
    @current_user = current_user
    leagues = League.where(user_id: @current_user.id)
    team_id = params[:id]
    @team = Team.find(team_id)
    @player_passports = PlayerPassport.where(team_id: team_id).includes(:player, :player_predictions)
    @freeagents = PlayerPassport.where(position: "WW")
    @jock_buff_ranks = JBR.new.jock_ranks(params[:league_id])
    @leagues = League.where(user_id: current_user)
  end

end
