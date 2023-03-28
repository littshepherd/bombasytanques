class PagoSeguridadSocialsController < ApplicationController
  before_action :set_pago_seguridad_social, only: %i[ show edit update destroy ]

  # GET /pago_seguridad_socials or /pago_seguridad_socials.json
  def index
    @pago_seguridad_socials = PagoSeguridadSocial.all
  end

  # GET /pago_seguridad_socials/1 or /pago_seguridad_socials/1.json
  def show
  end

  # GET /pago_seguridad_socials/new
  def new
    @pago_seguridad_social = PagoSeguridadSocial.new
  end

  # GET /pago_seguridad_socials/1/edit
  def edit
  end

  # POST /pago_seguridad_socials or /pago_seguridad_socials.json
  def create
    @pago_seguridad_social = PagoSeguridadSocial.new(pago_seguridad_social_params)
    @pago_seguridad_socials.user_id =  Current.user.id
    respond_to do |format|
      if @pago_seguridad_social.save
        format.html { redirect_to pago_seguridad_social_url(@pago_seguridad_social), notice: "Pago seguridad social was successfully created." }
        format.json { render :show, status: :created, location: @pago_seguridad_social }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pago_seguridad_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pago_seguridad_socials/1 or /pago_seguridad_socials/1.json
  def update
    respond_to do |format|
      if @pago_seguridad_social.update(pago_seguridad_social_params)
        format.html { redirect_to pago_seguridad_social_url(@pago_seguridad_social), notice: "Pago seguridad social was successfully updated." }
        format.json { render :show, status: :ok, location: @pago_seguridad_social }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pago_seguridad_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_seguridad_socials/1 or /pago_seguridad_socials/1.json
  def destroy
    @pago_seguridad_social.destroy

    respond_to do |format|
      format.html { redirect_to pago_seguridad_socials_url, notice: "Pago seguridad social was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago_seguridad_social
      @pago_seguridad_social = PagoSeguridadSocial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pago_seguridad_social_params
      params.require(:pago_seguridad_social).permit(:valor, :comentario, :user_id, :persona_id)
    end
end
