class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    @groups = current_groups
    @poll = Poll.find(params['poll_id'])

  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  def edit_groups
    @groups = current_groups
    #render :layout => false
  end

  # POST /groups
  # POST /groups.xml
  def create
    #assign next position to new groups
    max_position = current_groups.map {|g| g.position}.max || 0
    params[:group][:position] = max_position + 1
    @group = Group.new(params[:group])
    @group.poll_id = session[:poll_id]

    respond_to do |format|
      if @group.save
        flash[:notice] = 'Group was successfully created.'
        format.html { redirect_to(:action => 'index') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end

  def moveup
    move_position(-1, params[:position].to_i, Group, current_groups)
    redirect_to(:action => 'index', :poll_id => params[:poll_id])
  end

  def movedown
    move_position(1, params[:position].to_i, Group, current_groups)
    redirect_to(:action => 'index', :poll_id => params[:poll_id])
  end
  
end
