class IvasController < ApplicationController
  before_action :set_iva, only: %i[ show edit update destroy ]

  # GET /ivas or /ivas.json
  def index
    @ivas = Iva.all
    @suma = 0
    @ivas.map { |x| 
      if x.accion.id == 1 || x.accion.id == 3 
        @suma += x.valor
      else
        @suma -= x.valor
      end
    }
  end

  # GET /ivas/1 or /ivas/1.json
  def show
  end

  # GET /ivas/new
  def new
    @iva = Iva.new
  end

  # GET /ivas/1/edit
  def edit
  end

  # POST /ivas or /ivas.json
  def create
    @iva = Iva.new(iva_params)
    @iva.user_id = Current.user.id
    respond_to do |format|
      if @iva.save
        format.html { redirect_to iva_url(@iva), notice: "Iva was successfully created." }
        format.json { render :show, status: :created, location: @iva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @iva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ivas/1 or /ivas/1.json
  def update
    respond_to do |format|
      if @iva.update(iva_params)
        format.html { redirect_to iva_url(@iva), notice: "Iva was successfully updated." }
        format.json { render :show, status: :ok, location: @iva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @iva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ivas/1 or /ivas/1.json
  def destroy
    @iva.destroy

    respond_to do |format|
      format.html { redirect_to ivas_url, notice: "Iva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iva
      @iva = Iva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def iva_params
      params.require(:iva).permit(:valor, :comentario, :accion_id, :user_id)
    end
end
