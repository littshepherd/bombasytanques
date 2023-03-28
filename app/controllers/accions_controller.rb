class AccionsController < ApplicationController
  before_action :set_accion, only: %i[ show edit update destroy ]

  # GET /accions or /accions.json
  def index
    @accions = Accion.all
  end

  # GET /accions/1 or /accions/1.json
  def show
  end

  # GET /accions/new
  def new
    @accion = Accion.new
  end

  # GET /accions/1/edit
  def edit
  end

  # POST /accions or /accions.json
  def create
    @accion = Accion.new(accion_params)

    respond_to do |format|
      if @accion.save
        format.html { redirect_to accion_url(@accion), notice: "Accion was successfully created." }
        format.json { render :show, status: :created, location: @accion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accions/1 or /accions/1.json
  def update
    respond_to do |format|
      if @accion.update(accion_params)
        format.html { redirect_to accion_url(@accion), notice: "Accion was successfully updated." }
        format.json { render :show, status: :ok, location: @accion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accions/1 or /accions/1.json
  def destroy
    @accion.destroy

    respond_to do |format|
      format.html { redirect_to accions_url, notice: "Accion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accion
      @accion = Accion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accion_params
      params.require(:accion).permit(:tipo_accion)
    end
end
