class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  protect_from_forgery except: [:upload_photo]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :amenities, :location, :update]

  def index
    @rooms = Room.all
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "保存完了"
    else
      flash[:alert] = "問題"
      render :new
    end
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def people
  end

  def photo_upload
  end

  def amenities
  end

  def location
  end

  def update
    new_params = room_params
    new_params = room_params.merge(active: true) if is_ready_room

    if @room.update(new_params)
      flash[:notice] = "保存完了"
    else
      flash[:alert] = "問題発生"
    end
    redirect_back(fallback_location: request.referer)
  end

  def upload_photo
    @room.photos.attach(params[:file])
    render json: { success: true }
  end
  def delete_photo
    @image = ActiveStorage::Attachment.find(params[:photo_id])
    @image.purge
    redirect_to photo_upload_room_path(@room)
  end
  def preload
    today = Date.today
    reservations = @room.reservations.where("start_date >= ? OR end_date >= ?", today, today)
    render json: reservations
  end
   
  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    output = {conflict: is_conflict(start_date, end_date, @room)}
    render json: output
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end
  def room_params
    params.require(:room).permit(:r_name, :r_photo, :r_self, :r_price, :r_create, :r_address, :people)
  end
  def is_authorised
    redirect_to root_path, alert: "権限がありません。" unless current_user.id == @room.user_id
  end
  
  def is_ready_room
    !@room.acts_like? && !@room.price.blank? && !@room.listing_name.blank? && !@room.photos.blank? && !@room.address.blank? && !@room.people.blank?
  end
  def is_conflict(start_date, end_date, room)
    check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0? true : false
  end
end
