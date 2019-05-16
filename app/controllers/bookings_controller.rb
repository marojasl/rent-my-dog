class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy]

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:user_id])
    @booking.user = @user
    @booking.destroy
    redirect_to user_path(@user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment, :user_id, :dog_id)
  end
end

end
