class ProductDetailsController < ApplicationController
        
    http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
    
        def index
            @product_details=ProductDetail.all
        end
    
        def new 
            @product_detail=ProductDetail.new
        end

        def edit
            @product_detail=ProductDetail.find(params[:id])
        end

        def create
            #render plain: params[:product_details].inspect
            @product_detail = ProductDetail.new(product_details_params) #that is created the object of model

            if @product_detail.save 
                redirect_to @product_detail
            else
                render 'new'
            end
        end

        def update 
            @product_detail=ProductDetail.find(params[:id])

            if @product_detail.update(product_details_params)
                redirect_to @product_detail
            else
                render 'edit'
            end
        end

        def show
            @product_detail=ProductDetail.find(params[:id])
        end
        
        def destroy
            @product_detail=ProductDetail.find(params[:id])
            @product_detail.destroy

            redirect_to product_details_path
        end
    private
        def product_details_params
            params.require(:product_detail).permit(:name,:category,:price)
        end
end
