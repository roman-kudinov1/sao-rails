class ProspectsController < ApplicationController
  before_action :set_prospect, only: [:show, :edit, :update, :destroy]

  # GET /prospects
  def index
    @prospects = Prospect.all
  end

  # GET /prospects/1
  def show
  end

  # GET /prospects/new
  def new
    @prospect = Prospect.new
  end

  # GET /prospects/1/edit
  def edit
  end

  # POST /prospects
  def create
    @prospect = Prospect.new(prospect_params)

    if @prospect.save
      redirect_to @prospect, notice: 'Prospect was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /prospects/1
  def update
    if @prospect.update(prospect_params)
      redirect_to @prospect, notice: 'Prospect was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /prospects/1
  def destroy
    @prospect.destroy
    redirect_to prospects_url, notice: 'Prospect was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospect
      @prospect = Prospect.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prospect_params
      params.require(:prospect).permit(:status, :name, :email, :mobile, :phone, :fax, :website, :other, :platform, :source_url, :fetches, :last_fetch)
    end
end
