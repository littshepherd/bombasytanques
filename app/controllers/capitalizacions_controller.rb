class CapitalizacionsController < ApplicationController
  before_action :set_capitalizacion, only: %i[ show edit update destroy ]

  # GET /capitalizacions or /capitalizacions.json
  def index
    @capitalizacions = Capitalizacion.all
    @suma = 0
    @capitalizacions.map { |x| 
      if x.accion.id == 1 || x.accion.id == 3 
        @suma += x.cantidad
      else
        @suma -= x.cantidad
      end
      
    }
    

  end

  # GET /capitalizacions/1 or /capitalizacions/1.json
  def show
  end

  # GET /capitalizacions/new
  def new
    @capitalizacion = Capitalizacion.new
  end

  # GET /capitalizacions/1/edit
  def edit
  end

  # POST /capitalizacions or /capitalizacions.json
  def create
    @capitalizacion = Capitalizacion.new(capitalizacion_params)
    @capitalizacion.user_id = Current.user.id
    respond_to do |format|
      if @capitalizacion.save
        format.html { redirect_to capitalizacion_url(@capitalizacion), notice: "Capitalizacion was successfully created." }
        format.json { render :show, status: :created, location: @capitalizacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @capitalizacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capitalizacions/1 or /capitalizacions/1.json
  def update
    respond_to do |format|
      if @capitalizacion.update(capitalizacion_params)
        format.html { redirect_to capitalizacion_url(@capitalizacion), notice: "Capitalizacion was successfully updated." }
        format.json { render :show, status: :ok, location: @capitalizacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @capitalizacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capitalizacions/1 or /capitalizacions/1.json
  def destroy
    @capitalizacion.destroy

    respond_to do |format|
      format.html { redirect_to capitalizacions_url, notice: "Capitalizacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capitalizacion
      @capitalizacion = Capitalizacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def capitalizacion_params
      params.require(:capitalizacion).permit(:cantidad, :comentario, :accion_id)
    end
end
