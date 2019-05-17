class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user

    @bookings_by_user = Booking.where(user: current_user)
    @bookings_for_user = Booking.where.not(user: current_user)
  end
end
