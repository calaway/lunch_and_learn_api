class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def new
    item = Item.create(name: params[:name], description: params[:description])
    render json: item
  end

  def update
    item = Item.update(params[:id], {name: params[:name], description: params[:description]})
    render json: Item.last
  end

  def destroy
    Item.destroy(params[:id])
  end
end
