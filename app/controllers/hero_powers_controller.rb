class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

    def create
        hero_powers= HeroPower.create!(hero_powers_params)
        hero_record = Hero.find(hero_powers.hero_id)
        render json: hero_record , serializer: ShowHeroPowersSerializer, status: :ok
    end
    def index
        hero_power= HeroPower.all
        render json: hero_power, status: :ok
    end

    private
  
    def hero_powers_params
      params.permit(:strength, :hero_id, :power_id)
    end

    def render_unproccessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
