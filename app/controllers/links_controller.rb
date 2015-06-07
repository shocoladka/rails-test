class LinksController < ApplicationController
  def create
    return redirect_to root_path if !signed_in?

    Link.create(permit_params)

    redirect_to user_path(current_user.id)
  end

  def permit_params
    params[:link][:user_id] = current_user.id
    params.require(:link).permit(:url, :description, :user_id)
  end
end