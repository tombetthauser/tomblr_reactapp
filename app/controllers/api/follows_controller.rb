class Api::FollowsController < ApplicationController

    def create
        @follow = Follow.new(follow_params)
        # @follow.author_id = current_user.id
        if @follow.save
            render :show
        else
            render json: @follow.errors.full_messages, status: 422
        end
    end
    
    def update
        @follow = Follow.find(params[:id])
        if @follow.save
            render "api/follows/show/"
        else
            render json: @follow.errors.full_messages, status: 422
        end
    end
    
    def destroy
        @follow = Follow.find(params[:id])
        @follow.destroy
        render :show
    end

    def index
        # follower_id = params.follower_id ? params.follower_id : null
        # @follows = follower_id ? User.find(follower_id).follows : Follow.all
        @follows = Follow.all
        # render :index
        render json: Follow.all
    end

    def show
        @follow = Follow.find(params[:id])
    end

    def user
        @follows = User.find(params[:id]).follows
        # respond_to do |format|
        #     format.json 
        # end
    end

    private

    def follow_params
        params.require(:follow).permit(:follower_id, :followed_blog_id)
    end
end