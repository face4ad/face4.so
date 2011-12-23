# encoding: UTF-8
class UsersController < ApplicationController

  def dashboard
    if not current_user.active
      redirect_to show_random_reg_question_path and return
    end
  end

  # show singup form, after the user login from sina.
  #/users/signup
  def signup 
    render :signup 
  end
 

  # answer the question, check answer is correct or not, if correct active user and go to dashboard page. if not back go question page.
  # At the same time, the statistics will be saved. 
  # TODO In front end, it should call ajax to check answer right or not but not through redirection mechanism
  # POST
  #/users/reg/
  def answer_reg_question
    logger.debug "registration question id: #{params[:reg_question][:id]}"
    @reg_question = RegQuestion.find(params[:reg_question][:id])
    #TODO should trim the answers 
    if @reg_question.answer == params[:reg_question][:answer]
      #Update the statistic of the answers
      @reg_question.correct_counter = @reg_question.correct_counter + 1
      @reg_question.save

      #Change the active flag of user
      current_user.active = true
      current_user.save

      #TODO dashboard is not prepared
      redirect_to dashboard_path
    else
      #Update the statistic of the answers
      @reg_question.wrong_counter = @reg_question.wrong_counter + 1
      @reg_question.save

      #Save the last answer to question object to let user modify answer
      @reg_question.answer = params[:reg_question][:answer]
      flash[:notice] = "Your answer is incorrect, please retry"

      #Not user redirect, because have to save the pre enter answer
      render 'reg_questions/random'
    end
  end

end
