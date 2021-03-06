class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :authenticate_user!

  def index
    @todos = current_user.todos.all
  end

  def show
  end

  def new
    @todo = current_user.todos.build
  end

  def edit
  end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @todo }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url notice: 'Contact was successfully destroyed.'}
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def toggle_status
    @todo.status = !@todo.status
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path }
        format.json { render :show, status: :ok, location: @todo }
      else
      # show some error message
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:name, :notes)
     end
end
