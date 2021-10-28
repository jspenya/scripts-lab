class ChannelUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel

  # GET /channel_users or /channel_users.json
  def index
    @channel_users = ChannelUser.all
  end

  # GET /channel_users/1 or /channel_users/1.json
  def show
  end

  # GET /channel_users/new
  def new
    @channel_user = ChannelUser.new
  end

  # GET /channel_users/1/edit
  def edit
  end

  # POST /channel_users or /channel_users.json
  def create
    @channel.channel_users.where(user: current_user).first_or_create!
    redirect_to @channel
  end

  # PATCH/PUT /channel_users/1 or /channel_users/1.json
  def update
    respond_to do |format|
      if @channel_user.update(channel_user_params)
        format.html { redirect_to @channel_user, notice: "Channel user was successfully updated." }
        format.json { render :show, status: :ok, location: @channel_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @channel_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_users/1 or /channel_users/1.json
  def destroy
    @channel.channel_users.where(user: current_user).destroy_all
    redirect_to @channel
  end

  private
  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
