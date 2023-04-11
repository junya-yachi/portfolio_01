class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if params[:back] || !@client.save
      render :new and return
      redirect_to root_path
    elsif @client.save
      flash[:notice] = "新規取引先企業を登録しました"
      redirect_to complete_clients_path
    end
  end

  def confirm
    @client = Client.new(client_params)
    if @client.invalid?
      render :new
      return
    end
  end

  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      flash[:notice] = "取引先企業の情報を更新しました"
      redirect_to complete_clients_path
    else
      render 'clients/edit'
    end
    # @client = Client.update(client_params)
    # redirect_to complete_clients_path
  end

  private

  def client_params
    params.require(:client).permit(:cilent_name, :phone_num, :client_email, :user_id)
  end
end
