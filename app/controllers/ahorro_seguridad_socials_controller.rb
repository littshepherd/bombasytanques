class AhorroSeguridadSocialsController < ApplicationController
  before_action :set_ahorro_seguridad_social, only: %i[ show edit update destroy ]

  # GET /ahorro_seguridad_socials or /ahorro_seguridad_socials.json
  def index
    @ahorro_seguridad_socials = AhorroSeguridadSocial.all
    @suma = 0
    @ahorro_seguridad_socials.map { |x| 
      if x.accion.id == 1 || x.accion.id == 3 
        @suma += x.valor
      else
        @suma -= x.valor
      end
    }
  end

  # GET /ahorro_seguridad_socials/1 or /ahorro_seguridad_socials/1.json
  def show
  end

  # GET /ahorro_seguridad_socials/new
  def new
    @ahorro_seguridad_social = AhorroSeguridadSocial.new
   
  end

  # GET /ahorro_seguridad_socials/1/edit
  def edit
  end

  # POST /ahorro_seguridad_socials or /ahorro_seguridad_socials.json
  def create
    @ahorro_seguridad_social = AhorroSeguridadSocial.new(ahorro_seguridad_social_params)
    @ahorro_seguridad_social.user_id = Current.user.id
    respond_to do |format|
      if @ahorro_seguridad_social.save
        
        format.html { redirect_to ahorro_seguridad_social_url(@ahorro_seguridad_social), notice: "Ahorro seguridad social was successfully created." }
        format.json { render :show, status: :created, location: @ahorro_seguridad_social }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ahorro_seguridad_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ahorro_seguridad_socials/1 or /ahorro_seguridad_socials/1.json
  def update
    respond_to do |format|
      if @ahorro_seguridad_social.update(ahorro_seguridad_social_params)
        format.html { redirect_to ahorro_seguridad_social_url(@ahorro_seguridad_social), notice: "Ahorro seguridad social was successfully updated." }
        format.json { render :show, status: :ok, location: @ahorro_seguridad_social }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ahorro_seguridad_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ahorro_seguridad_socials/1 or /ahorro_seguridad_socials/1.json
  def destroy
    @ahorro_seguridad_social.destroy

    respond_to do |format|
      format.html { redirect_to ahorro_seguridad_socials_url, notice: "Ahorro seguridad social was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ahorro_seguridad_social
      @ahorro_seguridad_social = AhorroSeguridadSocial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ahorro_seguridad_social_params
      params.require(:ahorro_seguridad_social).permit(:valor, :comentario, :accion_id, :user_id)
    end
end
