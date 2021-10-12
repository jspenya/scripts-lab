class FbMessagesController < ApplicationController
  before_action :set_fb_message, only: %i[ show edit update destroy ]

  # GET /fb_messages or /fb_messages.json
  def index
    @fb_messages = FbMessage.all
  end

  # GET /fb_messages/1 or /fb_messages/1.json
  def show
  end

  # GET /fb_messages/new
  def new
    @fb_message = FbMessage.new
  end

  # GET /fb_messages/1/edit
  def edit
  end

  # POST /fb_messages or /fb_messages.json
  def create
    @fb_message = FbMessage.new(fb_message_params)

    respond_to do |format|
      if @fb_message.save
        format.html { redirect_to @fb_message, notice: "Fb message was successfully created." }
        format.json { render :show, status: :created, location: @fb_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fb_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fb_messages/1 or /fb_messages/1.json
  def update
    respond_to do |format|
      if @fb_message.update(fb_message_params)
        format.html { redirect_to @fb_message, notice: "Fb message was successfully updated." }
        format.json { render :show, status: :ok, location: @fb_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fb_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fb_messages/1 or /fb_messages/1.json
  def destroy
    @fb_message.destroy
    respond_to do |format|
      format.html { redirect_to fb_messages_url, notice: "Fb message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fb_message
      @fb_message = FbMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fb_message_params
      params.require(:fb_message).permit(:received, :reply)
    end
end
