class GameMembersController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
  end

  def show
    @game_member = GameMember.find(params[:id])
  end

  def new
    game = Game.find(params[:game_id])
    @game_member = GameMember.new(game: game)
    # TODO limit
    @squad_members = game.series.squad.squad_members
  end

  def edit
    game = Game.find(params[:game_id])
    @game_member = GameMember.find(params[:id])
    # TODO limit
    @squad_members = game.series.squad.squad_members
  end

  def create
    @game_member = GameMember.new(game_member_params)

    respond_to do |format|
      if @game_member.save
        format.html { redirect_to [@game_member.game, @game_member], notice: 'Game member was successfully created.' }
        format.json { render :show, status: :created, location: @game_member }
      else
        # TODO limit
        @squad_members = @game_member.game.series.squad.squad_members
        format.html { render :new }
        format.json { render json: @game_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @game_member = GameMember.find(params[:id])

    respond_to do |format|
      if @game_member.update(game_member_params)
        format.html { redirect_to [@game_member.game, @game_member], notice: 'Game member was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_member }
      else
        # TODO limit
        @squad_members = @game_member.game.series.squad.squad_members
        format.html { render :edit }
        format.json { render json: @game_member.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def game_member_params
    params.require(:game_member).permit(:status, :game_id, :squad_member_id)
  end
end
