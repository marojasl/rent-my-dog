class DogsController < ApplicationController

  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @dogs = policy_scope(Dog)

    if params[:query].present? && params[:lower_price].present?
      @dogs = Dog.search_by_breed_name_address(params[:query])
      @dogs = @dogs.select do |dog|
                dog.rate >= params[:lower_price].to_i && dog.rate <= params[:upper_price].to_i
              end
      @dogs = @dogs.reject { |d| d.latitude.nil? || d.longitude.nil? }
    elsif params[:lower_price].present?
      @dogs = Dog.all.select do |dog|
                dog.rate >= params[:lower_price].to_i && dog.rate <= params[:upper_price].to_i
              end
      @dogs = @dogs.reject { |d| d.latitude.nil? || d.longitude.nil? }
    else
      @dogs = Dog.all.reject { |d| d.latitude.nil? || d.longitude.nil? }
    end

    # if params[:postcode].present?
    #   @dogs = Dog.near(params[:postcode], 10)
    # else
    #   @dogs = Dog.where.not(latitude: nil, longitude: nil)
    # end

    @markers = @dogs.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { dog: dog }),
        image_url: helpers.asset_url('map-pin.png')
      }
    end
  end

  def show
    @chatroom = Chatroom.new
    @booking = Booking.new(dog: @dog)
    authorize @booking
    authorize @dog
  end

  def new
    @dog = Dog.new
    @booking = Booking.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    authorize @dog
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
    authorize @dog
  end

  def dog_params
    params.require(:dog).permit(:photo, :name, :breed, :description, :rate, :age, :address)
  end
end
