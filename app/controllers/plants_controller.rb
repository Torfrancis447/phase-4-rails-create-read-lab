class PlantsController < ApplicationController
    # GET ROUTE/Plants
    def index
        plant = Plant.all 
        render json: plant, except:[:created_at, :updated_at], status: :ok
    end
    # GET /plants/:id
    def show
        plant= Plant.find_by(id: params[:id])
        if plant
            return render json: plant, except:[:created_at, :updated_at], status: :ok
        else
            return render json: { error: "plant not found" }, status: :not_found
        end
    end
    # CREATE
    def create
        plant = Plant.create(plant_params)
        if plant
            render json: plant, status: :created
        else
            render json: { error: "plant not created"}, status: :not_found
        end        
        
    end

    private 
    def plant_params
        params.permit(:name, :image, :price)
    end

end
