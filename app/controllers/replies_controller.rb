class RepliesController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.build_reply
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.build_reply(reply_params)

    if @reply.save
      redirect_to tweet_path(@tweet), flash: {notice: "This will be replied to for the next 2 days"}
    else
      render :new
    end
  end

  private
  def reply_params
     params.require(:reply).permit(:text)
  end
end
