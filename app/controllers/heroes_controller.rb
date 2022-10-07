class HeroesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        heroes = Hero.all
        render json: heroes, status: :ok
    end

    def show
        heroes = Hero.find(params[:id])
        render json: heroes, serializer: ShowHeroPowersSerializer, status: :ok
    end
    private

    def render_not_found_response
        render json: { error: "Hero not found" }, status: :not_found
    end
end
