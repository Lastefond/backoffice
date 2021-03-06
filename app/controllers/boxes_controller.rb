class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:update_last_online]
  skip_before_action :authenticate_user!, :only => [:update_last_online, :show]

  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = Box.all.order(id: :asc)
  end

  # GET /boxes/1
  # GET /boxes/1.json
  def show
    @donator = Donator.new
    respond_to do |format|
      
      format.html { render :show }
      format.json { render json: {donations_sum: @box.sum_donations } }
      
      end
  end

  # GET /boxes/new
  def new
    @box = Box.new
  end

  # GET /boxes/1/edit
  def edit
  end

  # POST /boxes
  # POST /boxes.json
  def create
    @box = Box.new(box_params)

    respond_to do |format|
      if @box.save
        format.html { redirect_to @box, notice: 'Box was successfully created.' }
        format.json { render :show, status: :created, location: @box }
      else
        format.html { render :new }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boxes/1
  # PATCH/PUT /boxes/1.json
  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to @box, notice: 'Box was successfully updated.' }
        format.json { render :show, status: :ok, location: @box }
      else
        format.html { render :edit }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_last_online
    @box = Box.find(params[:id])
    @box.update_attribute(:last_online,  Time.at(params[:last_online]))
    respond_to do |format|
      format.json { render :show, status: :ok, location: @box }
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.json
  def destroy
    @box.destroy
    respond_to do |format|
      format.html { redirect_to boxes_url, notice: 'Box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def manual_donation

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def box_params
      params.require(:box).permit(:location, :city, :lat, :long, :sim_id)
    end
end
