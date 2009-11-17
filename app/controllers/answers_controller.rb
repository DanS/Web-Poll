class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.xml
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.xml
  def show
    @poll = Poll.find(params[:id])
    @answer_count = @poll.groups[0].questions[0].answers.length
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @answer }
    end
  end

  def tabular
    # display answers in tabular format
    @poll = Poll.find(params[:id])
    @answer_count = @poll.groups[0].questions[0].answers.length
    @question_ids = @poll.question_ids_by_position
    @responder_ids = @poll.responder_ids
    render 'tabular'
  end

  # GET /answers/new
  # GET /answers/new.xml
  def new
    @answer = Answer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.xml
  def create
    responder_id = params[:responder_id] || rand.to_s[2,15].to_i
    for ans in params[:answer].keys.select {|k|  k =~ /^answer_to_question_/}
      Answer.create(:responder_id=>responder_id, :question_id=>ans[-2,2].to_i,
        :answer_text=>params['answer'][ans])
    end

    flash[:notice] = 'Answers were successfully created.'
    redirect_to(Poll.find(params['answer']['poll_id']))
  end

  # PUT /answers/1
  # PUT /answers/1.xml
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        flash[:notice] = 'Answer was successfully updated.'
        format.html { redirect_to(@answer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.xml
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to(answers_url) }
      format.xml  { head :ok }
    end
  end
end
