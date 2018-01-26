class GameMembersController < ApplicationController
  # before_action :set_game_member, only: [:show, :edit, :update, :destroy]

  # GET /game_members
  # GET /game_members.json
  def index
    @game = Game.find(params[:game_id])
    @game_members = GameMember.where(game: @game)
  end

  # GET /game_members/1
  # GET /game_members/1.json
  def show
    @game_member = GameMember.find(params[:id])
  end

  # GET /game_members/new
  def new
    squad = Squad.find(params[:squad_id])
    game = Game.find(params[:game_id])
    @game_member = GameMember.new(game: game)
    @squad_members = @game_member.game.squad.squad_members

    # TODO is this required?
    raise unless squad == game.squad
  end

  # GET /game_members/1/edit
  def edit
    squad = Squad.find(params[:squad_id])
    game = Game.find(params[:game_id])
    @game_member = GameMember.find(params[:id])
    @squad_members = @game_member.game.squad.squad_members

    # TODO is this required?
    raise unless squad == game.squad
  end

  # POST /game_members
  # POST /game_members.json
  def create
    @game_member = GameMember.new(game_member_params)

    respond_to do |format|
      if @game_member.save
        format.html { redirect_to [@game_member.game.squad, @game_member.game, @game_member], notice: 'Game member was successfully created.' }
        format.json { render :show, status: :created, location: @game_member }
      else
        # TODO limit
        @squad_members = @game_member.game.squad.squad_members
        format.html { render :new }
        format.json { render json: @game_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_members/1
  # PATCH/PUT /game_members/1.json
  def update
    @game_member = GameMember.find(params[:id])

    respond_to do |format|
      if @game_member.update(game_member_params)
        format.html { redirect_to [@game_member.game.squad, @game_member.game, @game_member], notice: 'Game member was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_member }
      else
        # TODO limit
        @squad_members = @game_member.game.squad.squad_members
        format.html { render :edit }
        format.json { render json: @game_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_members/1
  # DELETE /game_members/1.json
  # def destroy
  #   @game_member.destroy
  #   respond_to do |format|
  #     format.html { redirect_to game_members_url, notice: 'Game member was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_game_member
  #   @game_member = GameMember.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_member_params
    params.require(:game_member).permit(:status, :game_id, :squad_member_id)
  end
end
