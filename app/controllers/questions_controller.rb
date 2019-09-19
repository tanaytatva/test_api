class QuestionsController < ApplicationController

  def index
    questions = Question.all
    render json: questions.to_json( :include => [:mapping, :role] ), status: 200
  end

  def mapping_index
    mappings = Mapping.all
    render json: mappings.to_json, status: 200
  end

  def role_index
    roles = Role.all
    render json: roles.to_json, status: 200
  end

  def create
    question = Question.create(question_params)
    render json: question.to_json, status: 200
  end

  def update
    question = Question.find_by(id: params[:id])
    question.update(question_params)
    render json: question.to_json, status: 200
  end

  def destroy
    question = Question.find_by(id: params[:id])
    question.destroy
    render json: {message: 'Destroy successfully'}, status: 200
  end


  private

  def question_params
    params.require(:question).permit(:question, :role_id, :mapping_id, :question_type, :is_required, :team_stage, :appear, :conditions, :frequency)
  end
end
