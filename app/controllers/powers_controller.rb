class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

    def index
        power = Power.all
        render json: power, status: :ok
    end

    def show
        power = find_params
        render json: power, status: :ok
    end

    def update
        power = find_params
        power.update!(power_params)
        render json: power, status: :ok

    end

    private

    def find_params
        Power.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Power not found" }, status: :not_found
    end

    def power_params
        params.permit(:description)
    end
  
    def render_unproccessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
