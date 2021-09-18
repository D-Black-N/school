class SessionsController < ApplicationController
  def new
    @message = params[:message]
  end

  def create
    admin = Admin.find_by_login(params[:session][:login])
    respond_to do |format|
      if admin && admin.authenticate(params[:session][:password])
        log_in admin
        format.html { redirect_to admin_index_path }
        format.json
      else
        format.html { redirect_to admin_path message: "Ошибка аутентификации, неверный логин или пароль"}
        format.json { render json: params }
      end
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
