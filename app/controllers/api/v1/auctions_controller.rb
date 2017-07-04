class Api::V1::AuctionsController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_question, only: [:show, :destroy]
  # def show
  #   # Test if we're getting the current_user by rendering it
  #   # render json: current_user
  #   render json: @question
  # end

  def index
    @auctions = Auction.order(created_at: :desc)
    render
  end

  # def create
  #   question = Question.new(question_params)
  #   question.user = current_user
  #
  #   if question.save
  #     render json: { id: question.id }
  #   else
  #     render json: { errors: question.errors.full_messages }
  #   end
  # end
  #
  # def destroy
  #   if @question.destroy
  #     render json: @question
  #   else
  #     render json: { errors: @question.errors.full_messages }
  #   end
  # end
  #
  # private
  # def question_params
  #   params.require(:question).permit(:title, :body)
  # end
  #
  # def find_question
  #   @question = Question.find(params[:id])
  # end
end
