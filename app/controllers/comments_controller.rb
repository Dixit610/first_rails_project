class CommentsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "admin",only: :destroy
   
    def create
    @product_detail= ProductDetail.find(params[:product_detail_id])
    @comment =@product_detail.comments.create(param_comment)
    redirect_to product_detail_path(@product_detail)
   end
   def destroy
    @product_detail =ProductDetail.find(params[:product_detail_id])
    @comment = @product_detail.comments.find(params[:id])
    @comment.destroy
    redirect_to product_detail_path(@product_detail)
    end
    def param_comment
    params.require(:comment).permit(:commenter,:body)
    end
end
