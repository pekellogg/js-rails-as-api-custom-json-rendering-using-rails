class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # rails magic "under the hood"
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird

    # option 1: no rails magic
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    
    # option 2: ruby method
    # render json: bird.slice(:id, :name, :species)

    # option 3: rails magic!
    if bird
      render json: bird, only: [:id, :name, :species]
    else
      render json: { message: 'Bird not found' }
    end
    # OR
    # render json: bird, except: [:created_at, :updated_at]
  end
end