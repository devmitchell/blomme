class HomeController < ApplicationController
  def index
    @open_issues = Issue.opened.order('priority ASC')
    @closed_issues = Issue.closed.order('updated_at DESC')
  end
end
