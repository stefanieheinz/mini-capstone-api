Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/all_products", controller: "products", action: "all_products"
  get "/first_product", controller: "products", action: "first_product"
  get "/second_product", controller: "products", action: "second_product"
  get "/third_product", controller: "products", action: "third_product"
end
