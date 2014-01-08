# encoding:utf-8

class Todo3sController < ApplicationController
  # respond_to :json

  before_action :set_todo3, only: [:show, :edit, :update, :destroy]

  # GET /todo3s
  # GET /todo3s.json
  def index
    # 讓這個 Controller 只會回覆 JSON 格式
    respond_to :json

    @todo3s = Todo3.all
  end

  # GET /todo3s/1
  # GET /todo3s/1.json
  def show
  end

  # GET /todo3s/new
  def new
    @todo3 = Todo3.new
  end

  # GET /todo3s/1/edit
  def edit
  end

  # POST /todo3s
  # POST /todo3s.json
  def create
    @todo3 = Todo3.new(todo3_params)

    respond_to do |format|
      if @todo3.save
        format.html { redirect_to @todo3, notice: 'Todo3 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @todo3 }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo3s/1
  # PATCH/PUT /todo3s/1.json
  def update
    respond_to do |format|
      if @todo3.update(todo3_params)
        format.html { redirect_to @todo3, notice: 'Todo3 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo3s/1
  # DELETE /todo3s/1.json
  def destroy
    @todo3.destroy
    respond_to do |format|
      format.html { redirect_to todo3s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo3
      @todo3 = Todo3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo3_params
      params.require(:todo3).permit(:label)
    end
end
