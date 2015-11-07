class Api::V1::BeersController < InheritedResources::Base

  def create
    ### Sanity Checks
    #p beer_params[:abv]
    #p flavor_params[0][:name]
    #p @current_user[:email]
    ###
    
    

    render json: { error: 'Add beer is unimplemented' }
  end

  private

    def beer_params
      params.require(:beer).permit(:abv, :name, :flavors)
    end
    
    def flavor_params
      params.require(:flavor)
      
      ### TODO I should put an iterator here maybe to whitelist the values for each
      # flavor object, maybe something like this (worked in create method):
      #
      # RUBY ITERATION LESSON:
      # flavor_params.each do |flavor|
      #   # each flavor hash: {"name"=>"oneName", "rating"=>42}
      #   p flavor
      #   flavor.each do |value|
      #     # each tuple in flavor hash: ["name", "oneName"]
      #     p value
      #     value.each do |thing|
      #       # each element in tuple: "name" \n "oneName"
      #       p thing
      #     end
      #   end
      # end
      ###
    end
end

