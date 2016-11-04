class RequisitionsController < ApplicationController
  before_action :set_requisition, only: [:show, :edit, :update]
  before_action :validate_user

  # GET /requisitions
  # GET /requisitions.json
  def index
    @requisitions = current_user.requisitions.all
  end

  # GET /requisitions/1
  # GET /requisitions/1.json
  def show    
  end

  # GET /requisitions/new
  def new
    @requisition = Requisition.new
  end

  # GET /requisitions/1/edit
  def edit
    @reference = Reference.new
    # @references = current_user.requisitions
  end

  # POST /requisitions
  # POST /requisitions.json
  def create
    @requisition = current_user.requisitions.new(requisition_params)

    respond_to do |format|
      if @requisition.save
        format.html { redirect_to @requisition, notice: 'La solicitud fue creada con éxito.' }
        format.json { render :show, status: :created, location: @requisition }
      else
        format.html { render :new }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requisitions/1
  # PATCH/PUT /requisitions/1.json
  def update
    respond_to do |format|
      if @requisition.update(requisition_params)
        format.html { redirect_to @requisition, notice: 'La solicitud se actualizó con éxito.' }
        format.json { render :show, status: :ok, location: @requisition }
      else
        format.html { render :edit }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requisitions/1
  # DELETE /requisitions/1.json
  def destroy
    @requisition.destroy
    respond_to do |format|
      format.html { redirect_to requisitions_url, notice: 'La solicitud se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  def validate_user
    if current_user
      
      # Validar perfil completo    
      if current_user.first_name.nil?
        redirect_to '/profile', notice: 'Debe llenar su perfil para realizar solicitudes de crédito.'   
      end

    else
      redirect_to root_path, notice: 'Debe iniciar sesión para poder generar solicitudes.'
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requisition
      @requisition = current_user.requisitions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requisition_params
      params.require(:requisition).permit(:user_id, :income, :address_years, :marital_status, :dependents_number, :requested_amount, :payment_terms, 
                                          :bank, :company_name, :company_phone_number, :company_position, :company_years, :has_sgmm, :has_imss, :has_car, :comment)
    end
end
