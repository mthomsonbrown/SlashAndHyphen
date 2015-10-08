class BeersController < InheritedResources::Base

  private

    def beer_params
      params.require(:beer).permit(:name, :abv, :user_id)
    end
end

