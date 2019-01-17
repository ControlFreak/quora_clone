class QuestionsController < ApplicationController

  before_action :authenticate_user!

  def index
    @questions = Question.includes(:user).all
  end

  def new
    @question  = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.includes(:user, :answers).find(params[:id])
  end

  def like
    @question = Question.find(params[:id])
    @question.liked_by(current_user)
    redirect_to questions_path
  end

  def follow_question
    @question = Question.find(params[:id])
    current_user.follow(@question)
    redirect_to questions_path
  end

  private
  # Using a private method to encapsulate the permissible parameters is
  # a good pattern since you'll be able to reuse the same permit
  # list between create and update. Also, you can specialize this method
  # with per-user checking of permissible attributes.
  def question_params
    params.require(:question).permit(:title, :content)
  end

end
