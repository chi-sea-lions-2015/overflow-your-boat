class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new

  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render "index"
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    if @question.save
      redirect_to @question
    else
      render "edit"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to user_path(current_user)
  end

  private

    def question_params
      params.require(:question).permit(:title, :description)
    end

end
