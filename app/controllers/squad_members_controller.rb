class SquadMembersController < ApplicationController
  # before_action :set_squad_member, only: [:show, :edit, :update, :destroy]

  # GET /squad_members
  # GET /squad_members.json
  def index
    @squad = Squad.find(params[:squad_id])
    @squad_members = SquadMember.where(squad: @squad)
  end

  # GET /squad_members/1
  # GET /squad_members/1.json
  def show
    @squad_member = SquadMember.find(params[:id])
  end

  # GET /squad_members/new
  def new
    squad = Squad.find(params[:squad_id])

    @users = User.active.where.not(id: squad.squad_members.active.map(&:user_id))
    @squad_member = SquadMember.new(squad: squad)

    raise unless squad == @squad_member.squad
  end

  # GET /squad_members/1/edit
  def edit
    squad = Squad.find(params[:squad_id])

    @users = User.active.where.not(id: squad.squad_members.active.map(&:user_id))
    @squad_member = SquadMember.find(params[:id])

    raise unless squad == @squad_member.squad
  end

  # POST /squad_members
  # POST /squad_members.json
  def create
    @squad_member = SquadMember.new(squad_member_params)

    respond_to do |format|
      if @squad_member.save
        format.html { redirect_to [@squad_member.squad, @squad_member], notice: 'Squad member was successfully created.' }
        format.json { render :show, status: :created, location: @squad_member }
      else
        @users = User.all
        # TODO put this back post testing
        # @users = User.where.not(id: @squad_member.squad.squad_members.active.map(&:user_id))
        format.html { render :new }
        format.json { render json: @squad_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squad_members/1
  # PATCH/PUT /squad_members/1.json
  def update
    @squad_member = SquadMember.find(params[:id])

    respond_to do |format|
      if @squad_member.update(squad_member_params)
        format.html { redirect_to [@squad_member.squad, @squad_member], notice: 'Squad member was successfully updated.' }
        format.json { render :show, status: :ok, location: @squad_member }
      else
        @users = User.all
        # TODO put this back post testing
        # @users = User.where.not(id: @squad_member.squad.squad_members.active.map(&:user_id))
        format.html { render :edit }
        format.json { render json: @squad_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squad_members/1
  # DELETE /squad_members/1.json
  # def destroy
  #   @squad_member.destroy
  #   respond_to do |format|
  #     format.html { redirect_to squad_members_url, notice: 'Squad member was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_squad_member
  #   @squad_member = SquadMember.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def squad_member_params
    params.require(:squad_member).permit(:status, :squad_id, :user_id)
  end
end
