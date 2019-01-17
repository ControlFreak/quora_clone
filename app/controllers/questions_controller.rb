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
    @question = Question.find(params[:id])
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
