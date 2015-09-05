class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue, only: [:edit, :update, :close]
  before_action :prevent_unauthorized_user, only: [:edit, :update, :close]

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params.merge(owner: current_user))

    respond_to do |format|
      if @issue.save
        format.html { redirect_to root_path, notice: 'Issue was successfully created.' }
        format.json { render :index, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to root_path, notice: 'Issue was successfully updated.' }
        format.json { render :index, status: :ok, location: root_path }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /issues/1/close
  # POST /issues/1/close.json
  def close
    respond_to do |format|
      if @issue.update closer: current_user
        format.html { redirect_to root_path, notice: 'Issue was successfully closed.' }
        format.json { render :index, status: :ok, location: root_path }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:statement, :priority, :acknowledged, :votes)
    end

    # Renders a 403 if the user interacting with the issue is not authorized to do so.
    def prevent_unauthorized_user
      unless current_user.can_manage_issue? @issue
        render status: :forbidden, nothing: true
      end
    end
end
