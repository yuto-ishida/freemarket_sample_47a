crumb :root do
  link "メルカリ", root_path
end

# ユーザ一覧ページヘのパンくずリスト
crumb :mypages do
  link "マイページ",mypage_path(current_user)
  parent :root
end
# ユーザ個別ページへのパンくずリスト
crumb :mypages_cards do
  link "支払い方法", mypages_cards_path
  parent :mypages
end

crumb :new_mypages_card do
  link "クレジットカード情報入力", new_mypages_card_path
  parent :mypages_cards
end

crumb :edit_mypage do
  link "プロフィール", edit_mypage_path(current_user)
  parent :mypages
end

crumb :new_mypages_identification do
  link "本人情報の登録", new_mypages_identification_path
  parent :mypages
end

crumb :mypages_logouts do
  link "ログアウト", mypages_logouts_path
  parent :mypages
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
