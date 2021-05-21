class ProductsController < ApplicationController
  # def all_products
  #   product = Product.all
  #   render json: product.as_json
  # end

  # def first_product
  #   product = Product.first
  #   render json: product.as_json
  # end

  # def second_product
  #   product = Product.second
  #   render json: product.as_json
  # end

  # def third_product
  #   product = Product.third
  #   render json: product.as_json
  # end

  # def query_params
  #   input_product = params["product_id"]
  #   render json: input_product.as_json
  # end
  before_action :authenticate_admin, except: [:index, :show]

  def index
    products = Product.all
    render json: products
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id],
    )
    if product.save
      Image.create(product_id: product_id, url: params[:image_url])
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: 422
    end
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.save
    render json: product
    if product.save
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product successfully destroyed!!" }
  end
end
