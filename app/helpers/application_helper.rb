module ApplicationHelper
  def current_year
    Time.new.year
  end

  def github_url(author, repo)
    link_to "Github", "https://github.com/#{author}/#{repo}"
  end
end
