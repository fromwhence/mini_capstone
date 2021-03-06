class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render 'index.json.jb' 
  end

  def create
    @product = Product.new(
                          id: params[:id],
                          name: params[:name],
                          price: params[:price],
                          image_url: params[:image_url],
                          description: params[:description]
                          )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end

        
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description

    if @product.save
      render 'show.json.jb' # happy path
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity # sad path
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Successfully Destroyed Recipe."}   
  end

end
