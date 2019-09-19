class QuestionsController < ApplicationController

  def update
  end

  def index
    @questions = Question.all
    render json: @questions.to_json( :include => [:mapping, :role] ), status: 200
  end
end
