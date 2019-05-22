class PaymentsController < ApplicationController

  def new
    @payment = Payment.new
    @booking = Booking.find(params[:booking_id])
    authorize @payment
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @payment = Payment.new(payment_params)
    @payment.booking = @booking
    authorize @payment
    if @payment.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit
  end
end
