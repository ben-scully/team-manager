class GamesController < ApplicationController

  # GET /games
  # GET /games.json
  def index
    @series = Series.find(params[:series_id])
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
  end

  # GET /games/new
  def new
    series = Series.find(params[:series_id])
    @game = Game.new(series: series)
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to [@game.series, @game], notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        @series = @game.series
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to [@game.series, @game], notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        @series = @game.series
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to squad_games_path, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_game
  #   @game = Game.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    # TODO can/should I use :squad_id or just :squad?
    # the above issue/question is for all controllers
    params.require(:game).permit(:status, :name, :start, :series_id)
  end
end
