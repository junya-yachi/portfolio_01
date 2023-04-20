module FillinModule
  def fillin(client)
    fill_in 'client[cilent_name]', with: client.cilent_name
    fill_in 'client[phone_num]', with: client.phone_num
    fill_in 'client[client_email]', with: client.client_email
  end
end
