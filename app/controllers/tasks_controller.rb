class TasksController < ApplicationController
  before_filter :get_user, :auth

  def auth
    if current_user == nil
      redirect_to signin_path
    end
  end

  def get_user
    @user = current_user
  end

  def index
    @todo   = @user.tasks.where(:done => false)
    @task   = @user.tasks.new
    @lists  = @user.lists
    @list   = @user.lists.new
    
    respond_to do |format|
      format.html
    end
  end


  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    if @task.save
        dc_event("New Task", @task.name)
        flash[:notice] = "Your task was created."
    else
        flash[:alert] = "There was an error creating your task."
    end
    dc_event("New Task", @task.name)
    redirect_to(list_tasks_url(@list))
  end
  

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to( list_tasks_url(@list), :notice => 'Task was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(list_tasks_url(@list)) }
    end
  end
  
 
end
