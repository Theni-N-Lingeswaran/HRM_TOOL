class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @all_tasks = current_user.tasks
  end
end
