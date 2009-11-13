class PollsController < ApplicationController
  # GET /polls
  # GET /polls.xml
  def index
    @polls = Poll.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /polls/1
  # GET /polls/1.xml
  def show
    @poll = Poll.find(params[:id])
      session['poll_id'] = @poll.id
    @questions = @poll.questions_in_groups
    @responder_id = 0
    @answer = Answer.new
  end

  # GET /polls/new
  # GET /polls/new.xml
  def new
    @poll = Poll.new
    @poll.groups.build(:poll_id=>@poll.id)
  end

  # GET /polls/1/edit
  def edit
    @poll = Poll.find(params[:id])
    session[:poll_id] = @poll.id
  end

  # POST /polls
  # POST /polls.xml
  def create
    modified_params = ensure_position_assigned(params)
    @poll = Poll.new(modified_params)
    @poll.user_id = current_user.id
    respond_to do |format|
      if @poll.save
        flash[:notice] = 'Poll was successfully created.'
        format.html { redirect_to(current_user) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /polls/1
  # PUT /polls/1.xml
  def update
    @poll = Poll.find(params[:id])

    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        flash[:notice] = 'Poll was successfully updated.'
        format.html { redirect_to(current_user) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.xml
  def destroy
    @poll = Poll.find(params[:id])
    session[:poll_id] = nil
    @poll.destroy

    respond_to do |format|
      format.html { redirect_to(polls_url) }
    end
  end

  def reorder
    @poll = Poll.find(params[:id])
    @groups = @poll.groups_by_position
  end
  
end
