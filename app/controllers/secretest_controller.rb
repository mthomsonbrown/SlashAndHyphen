class SecretestController < ApplicationController

	before_action :authenticate_user!

	def secret
	end
end
