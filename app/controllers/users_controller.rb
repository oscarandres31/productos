class UserController < ApplicationController
  skip_before_action :protect_pages, only: :show

  def show
    @user = User.find_by!(username: params[:username])
   # @pagy, @product = pagy_countless(FindProducts.new.call({ user_id: @user.id }).load_async, items: 12)
    # @pagy, @product = pagy_countless(FindProducts.new.call(product_params_index).load_async, items: 12)
  end
end