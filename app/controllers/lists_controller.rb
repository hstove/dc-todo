class ListsController < ApplicationController

  def create
    @list = current_user.lists.new(params[:list])
    if @list.save
        dc_event("New List", @list.name)
        flash[:notice] = "Your list was created"
    else
        flash[:alert] = "There was an error creating your list."
    end
    redirect_to(list_tasks_url(@list))
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
    end
  end
end
