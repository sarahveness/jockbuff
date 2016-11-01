class ComparesController < ApplicationController

  def index
    @current_user_players = GetCurrentUserTeamInfo.new.get_roster(params[:league_id])
    @user_team_name = GetCurrentUserTeamInfo.new.get_team_name(params[:user_id], params[:league_id])
    @team_info = Team.where(league_id: params[:league_id], ownership: false).pluck(:name, :id)
    @player_passports = PlayerPassport.includes(:player, :player_predictions)
  end

  def render_trade_table
    @trade_team = TradingWithRoster.new.get_roster(params[:team_id])
    @player_passports = PlayerPassport.includes(:player, :player_predictions)
    render :partial => 'render_trade_table'
  end


end
