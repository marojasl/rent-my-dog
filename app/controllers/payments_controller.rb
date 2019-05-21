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
    @payment.user = current_user
    authorize @payment
    if @payment.save
      redirect_to payment_path(@payment)
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit
  end
end
