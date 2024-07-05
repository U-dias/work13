class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
    @range = params(:renge)
    if @range == "room"
      @rooms = Room.looks(params[:search],params[:keyword])
    end

end
