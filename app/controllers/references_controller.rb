class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update]
  before_action :set_requisition

  # GET /references
  # GET /references.json
  def index
    @references = Reference.all
  end

  # GET /references/1
  # GET /references/1.json
  def show
  end

  # GET /references/new
  def new
    @reference = Reference.new
  end

  # GET /references/1/edit
  def edit
  end

  # POST /references
  # POST /references.json
  def create
    @reference = current_user.references.new(reference_params)
    @reference.requisition = @requisition

    respond_to do |format|
      if @reference.save
        format.html { redirect_to @reference.requisition, notice: 'La referencia se creó con éxito.' }
        format.json { render :show, status: :created, location: @reference }
      else
        format.html { render :new }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /references/1
  # PATCH/PUT /references/1.json
  def update
    respond_to do |format|
      if @reference.update(reference_params)
        format.html { redirect_to @reference.requisition, notice: 'La referencia se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @reference }
      else
        format.html { render :edit }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference.destroy
    respond_to do |format|
      format.html { redirect_to references_url, notice: 'La referencia fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    def set_requisition 
      @requisition = Requisition.find(params[:requisition_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reference_params
      params.require(:reference).permit(:user_id, :requisition_id, :first_name, :second_name, :first_last_name, :second_last_name, :cell_phone_number)
    end
end
