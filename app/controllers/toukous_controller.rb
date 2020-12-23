class ToukousController < ApplicationController
  before_action :set_toukou, only: [:show, :edit, :update, :destroy]

  def index
    @toukous = Toukou.all
  end
  def show
  end
  def new
    @toukou = Toukou.new
  end
  def edit
  end
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

  def destroy
    @toukou.destroy
    respond_to do |format|
      format.html { redirect_to toukous_url, notice: '投稿内容を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
  def set_toukou
      @toukou = Toukou.find(params[:id])
  end

  def toukou_params
      params.require(:toukou).permit(:content)
  end
end
