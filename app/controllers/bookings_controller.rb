class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def show
    @user = current_user
  end

  def new
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])
    @dates = @dog.bookings.map do |booking|
      { from: booking.start_date.strftime("%Y-%m-%e").gsub(' ', '0'), to: booking.end_date.strftime("%Y-%m-%e").gsub(' ', '0') }
    end
    # raise
    authorize @booking
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.dog = @dog
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to new_booking_payment_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.user = current_user
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment)
  end
end
