class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    @house = House.find(params[:id])
    @stations = Station.where(house_id: @house.id)
  end

  # GET /houses/new
  def new
    @house = House.new
    @stations = 2.times{@house.stations.build}
  end

  # GET /houses/1/edit
  def edit
    @stations = 1.times{@house.stations.build}
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: '新規物件を登録しました。' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @house.update(update_params)
        format.html { redirect_to @house, notice: '物件情報を更新しました。' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: '物件情報を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def house_params
      params.require(:house).permit(:name, :price, :address, :age, :note, stations_attributes: [:root, :st_name, :time])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_params
      params.require(:house).permit(:name, :price, :address,:age,:note, 
        stations_attributes:[:id, :root, :st_name, :time,:_destroy])
    end
end
