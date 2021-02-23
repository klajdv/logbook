class LocationsController < ApplicationController

before_action  :find_location, only:[:show, :edit, :update, :destroy]

def find_location
    @location = Location.find(params[:id])
end


def index
	@location = Location.all.order("created_at DESC")
end

def filter
	start_at = params[:start_at]
	end_at = params[:end_at]
	start_km = params[:start_km]
	end_km = params[:end_km]
    @location = Location.where("date between ? and ? ",start_at,end_at)
	
end


def new	
	@location = Location.new
end

def show
    @location = Location.find(params[:id])
end

def create

	@location = Location.new(location_params)
if @location.save
	redirect_to root_path
else 
	render 'new'
end
end

def update
	@location.update(location_params)
end

def delete
end

def destroy
	@location.destroy
	redirect_to root_path
end


def location_params
	params.require(:location).permit(:name,:distance,:date)
end

end
