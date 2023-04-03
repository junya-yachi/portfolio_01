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
      flash[:notice] = "取引先を新規登録しました"
      redirect_to clients_path
    end
  end
  def confirm
    @client = Client.new(client_params)
    if @client.invalid?
      render :new
      return
    end
  end
  private
    def client_params
      params.require(:client).permit(:cilent_name, :phone_num, :client_email, :user_id)
    end
end
