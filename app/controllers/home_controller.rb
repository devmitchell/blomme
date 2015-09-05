class HomeController < ApplicationController
  def index
    @open_issues = Issue.opened
    @closed_issues = Issue.closed
  end
end
