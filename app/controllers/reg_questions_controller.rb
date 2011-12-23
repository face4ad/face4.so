class RegQuestionsController < ApplicationController
  # GET /reg_questions
  # GET /reg_questions.json
  def index
    @reg_questions = RegQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reg_questions }
    end
  end

  # show the questions to check whether the user is programmer or not 
  # TODO when change the question, it should get the question through AJAX
  # GET
  #/users/reg/
  def random
    @reg_question = RegQuestion.random_question
    #Hide the answer, so that no body no the answer in front end
    @reg_question.answer = nil
  end

  # GET /reg_questions/1
  # GET /reg_questions/1.json
  def show
    @reg_question = RegQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reg_question }
    end
  end

  # GET /reg_questions/new
  # GET /reg_questions/new.json
  def new
    @reg_question = RegQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reg_question }
    end
  end

  # GET /reg_questions/1/edit
  def edit
    @reg_question = RegQuestion.find(params[:id])
  end

  # POST /reg_questions
  # POST /reg_questions.json
  def create
    @reg_question = RegQuestion.new(params[:reg_question])

    respond_to do |format|
      if @reg_question.save
        format.html { redirect_to @reg_question, notice: 'Reg question was successfully created.' }
        format.json { render json: @reg_question, status: :created, location: @reg_question }
      else
        format.html { render action: "new" }
        format.json { render json: @reg_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reg_questions/1
  # PUT /reg_questions/1.json
  def update
    @reg_question = RegQuestion.find(params[:id])

    respond_to do |format|
      if @reg_question.update_attributes(params[:reg_question])
        format.html { redirect_to @reg_question, notice: 'Reg question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @reg_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reg_questions/1
  # DELETE /reg_questions/1.json
  def destroy
    @reg_question = RegQuestion.find(params[:id])
    @reg_question.destroy

    respond_to do |format|
      format.html { redirect_to reg_questions_url }
      format.json { head :ok }
    end
  end
end
