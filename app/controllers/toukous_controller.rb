class ToukousController < ApplicationController
  before_action :set_toukou, only: [:show, :edit, :update, :destroy]
  # GET /toukous
  # GET /toukous.json
  def index
    @toukous = Toukou.all
  end
  # GET /toukous/1
  # GET /toukous/1.json
  def show
  end
  # GET /toukous/new
  def new
    @toukou = Toukou.new
  end
  # GET /toukous/1/edit
  def edit
  end
  # POST /toukous
  # POST /toukous.json
  def create
    @toukou = Toukou.new(toukou_params)
    if params[:back]
       render :new
    else
      respond_to do |format|
      if @toukou.save
          format.html { redirect_to @toukou, notice: '正常に投稿されました。' }
          format.json { render :show, status: :created, location: @toukou }
      else
          format.html { render :new }
          format.json { render json: @toukou.errors, status: :unprocessable_entity }
      end
     end
    end
  end
  # PATCH/PUT /toukous/1
  # PATCH/PUT /toukous/1.json
  def update
    respond_to do |format|
      if @toukou.update(toukou_params)
        format.html { redirect_to @toukou, notice: '投稿内容が更新されました。' }
        format.json { render :show, status: :ok, location: @toukou }
      else
        format.html { render :edit }
        format.json { render json: @toukou.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @toukou = Toukou.new(toukou_params)
    render :new if @toukou.invalid?
  end
  # DELETE /toukous/1
  # DELETE /toukous/1.json
  def destroy
    @toukou.destroy
    respond_to do |format|
      format.html { redirect_to toukous_url, notice: '投稿内容を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toukou
      @toukou = Toukou.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def toukou_params
      params.require(:toukou).permit(:content)
    end
end
