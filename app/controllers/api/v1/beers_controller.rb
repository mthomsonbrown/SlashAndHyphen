class Api::V1::BeersController < InheritedResources::Base

  def create
    @beer = @current_user.beers.create! beer_params
    @beer.flavors.create! flavor_params
   
    render json: { success: "Added " + beer_params[:name] + "!" }
  end

  private

    def beer_params
      params.require(:beer).permit(:abv, :name, :flavors)
    end
    
    def flavor_params
      params.permit(flavors:[:name, :rating])[:flavors]
    end
end

