module ApplicationHelper
  def blind(password)
    i = 0
    blind_password = ""
    while i < password.length
      blind_password += "*"
      i += 1
    end
    blind_password
  end
end
