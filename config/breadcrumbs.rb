crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
end

crumb :user_new do
  link "新規ユーザー登録", new_user_session_path
end

crumb :user_session do
  link "ログイン", user_session
end

crumb :use_raddress do
  link "住所登録", new_user_registration_path
  parent :user_session
end

crumb :card do
  link "カード登録", new_card_path
  parent :mypage
end

crumb :card_show do
  link "カード情報", card_path(params[:id])
  parent :mypage
end

crumb :item do
  link "商品情報", item_path(params[:id])
end

crumb :edit_item do
  link "商品情報変更", edit_item_path(params[:id])
  parent :item
end

crumb :new_item_path do
  link "商品投稿", new_item_path
end

crumb :purchase_index do
  link "購入確認画面", purchase_index_path
  parent :item
end

crumb :done_purchase_index do
  link "購入完了画面", done_purchase_index_path
  parent :item
end

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