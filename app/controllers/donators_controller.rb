class DonatorsController < ApplicationController
  before_action :set_donator, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create]
  # GET /donators
  # GET /donators.json
  def index
    @donators = Donator.all
  end

  # GET /donators/1
  # GET /donators/1.json
  def show
  end

  # GET /donators/new
  def new
    @donator = Donator.new
  end

  # GET /donators/1/edit
  def edit
  end

  # POST /donators
  # POST /donators.json
  def create
    
    
    return @donator = create_donation(donator_params) unless params['_json'].present?

    params['_json'].each do |donator|
      create_donation(donator.permit(:box_id, :name))
    end if params['_json'].present?
    
  end

  # PATCH/PUT /donators/1
  # PATCH/PUT /donators/1.json
  def update
    respond_to do |format|
      if @donator.update(donator_params)
        format.html { redirect_to @donator, notice: 'Donator was successfully updated.' }
        format.json { render :show, status: :ok, location: @donator }
      else
        format.html { render :edit }
        format.json { render json: @donator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donators/1
  # DELETE /donators/1.json
  def destroy
    @donator.destroy
    respond_to do |format|
      format.html { redirect_to donators_url, notice: 'Donator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def create_donation(donator)
      donator[:timestamp] = Time.now.to_i unless donator[:timestamp].present?
      @donator= Donator.create(
          name: donator[:name],
          received_at: DateTime.strptime(donator[:timestamp].to_s,'%s'),
          box: Box.find(donator[:box_id])
        )
      binding.pry
      if donator[:coins].present?
        donator[:coins].each do |donation|
          @donator.donations.create(amount: BigDecimal(donation)/100)
        end 
      else
        Donation.create(donator: @donator, amount: donator[:donation][:amount])
      end
      
      respond_to do |format|
        if @donator.save
          @donator.send_to_web
          format.html { redirect_to Box.find(donator[:box_id]), notice: 'Donator was successfully created.' }
          format.json { render :show, status: :created, location: @donator }
        else
          format.html { render :new }
          format.json { render json: @donator.errors, status: :unprocessable_entity }
        end
      end
    end


    


    # Use callbacks to share common setup or constraints between actions.
    def set_donator
      @donator = Donator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donator_params
      return params.require('donator').permit(:box_id, :name, :timestamp, donation: [:amount]) unless params[:donator].present?
      params.permit(:box_id, :name, :timestamp, coins: [])
    end
end
