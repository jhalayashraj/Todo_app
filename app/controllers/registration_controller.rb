class RegistrationController < ApplicationController

def new

@user= User.new
@todo = Todo.new
end

def create

@user = User.new
@user.name = params[:user][:name]
@user.email = params[:user][:email]
@user.password = params[:user][:password]
@user.password_confirmation =params[:user][:password_confirmation]

@todo = Todo.new
@todo.mobile = params[:todo][:mobile]
@todo.address = params[:todo][:address]
@member.valid?
if @member.errors.blank?

@user.save
@todo.member = @user  
@todo.save
redirect_to dashboard_path
else
render :action => "new"
end
end

end
