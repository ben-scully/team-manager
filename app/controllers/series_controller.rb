class SeriesController < ApplicationController

  # GET /series
  # GET /series.json
  def index
    @squad = Squad.find(params[:squad_id])
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @series = Series.find(params[:id])
  end

  # GET /series/new
  def new
    squad = Squad.find(params[:squad_id])
    @series = Series.new(squad: squad)
  end

  # GET /series/1/edit
  def edit
    @series = Series.find(params[:id])
  end

  # POST /series
  # POST /series.json
  def create
    @series = Series.new(series_params)

    respond_to do |format|
      if @series.save
        format.html { redirect_to [@series.squad, @series], notice: 'Series was successfully created.' }
        format.json { render :show, status: :created, location: @series }
      else
        # @squad = Squad.find(params[:squad_id])
        @squad = @series.squad
        format.html { render :new }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    @series = Series.find(params[:id])

    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to [@series.squad, @series], notice: 'Series was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        # @squad = Squad.find(params[:squad_id])
        @squad = @series.squad
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to squad_series_path, notice: 'Series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_series
  #   @series = Series.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def series_params
    # TODO can/should I use :squad_id or just :squad?
    # the above issue/question is for all controllers
    params.require(:series).permit(:name, :status, :squad_id)
  end
end
