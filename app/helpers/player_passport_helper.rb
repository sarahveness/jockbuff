require 'byebug'
module PlayerPassportHelper

  def create_passport_entry (league_ids)
    @current_user = current_user
    league_ids.each do |league_id|
    draft_full = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.91006/draftresults", headers:{
    "Authorization" => "Bearer #{@current_user.token}"
    })
    draft_players = draft_full["fantasy_content"]["league"]["draft_results"]["draft_result"]
    draft_positions = draft_players.map do |player|
      draft_info = [player["pick"], player["player_key"].split('p.')[1]]
    end
    league_key = League.find_by(id: league_id.to_i).league_key
    team_info_arr = league_call(league_key)
    owned_players = team_info_arr.map do |team|
      player_info = team["fantasy_content"]["team"]["roster"]["players"]["player"]
      team_id = Team.find_by(league_id: league_id, name: team['fantasy_content']['team']['name']).id
      player_info.map do |t|
        if draft_positions.flatten.values_at(* draft_positions.flatten.each_index.select{|i| i.odd?}).include?(t["player_id"])
          draft_position = draft_positions.select{ |pick, id| id == t["player_id"] }[0][0].to_i
        end
        PlayerPassport.new(
        player_id: t["player_id"].to_i,
        position: t["selected_position"]["position"],
        team_id: team_id,
        league_id: league_id,
        draft_position: draft_position
        )
      end
    end

      owned_players = PlayerPassport.where(league_id: league_id).pluck('player_id')
      all_players = Player.all.pluck('player_id')
      available_players = all_players - owned_players
      waiver_players = available_players.map do |p|
        if draft_positions.flatten.values_at(* draft_positions.flatten.each_index.select{|i| i.odd?}).include?(p)
          draft_position = draft_positions.select{ |pick, id| id == p}[0][0]
        end
          PlayerPassport.new(
          player_id: p,
          position: 'WW',
          team_id: Team.find_by(league_id: league_id, name: 'Waiver').id,
          league_id: league_id,
          draft_position: draft_position
        )
      end
      # full_league = owned_players.push(waiver_players)
      ActiveRecord::Base.transaction do
        PlayerPassport.import(owned_players)
      end
      p waiver_players
      ActiveRecord::Base.transaction do
          PlayerPassport.import(waiver_players)
      end
    end
  end
end