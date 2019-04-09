crumb :root do
  link "メルカリ", root_path
end

crumb :mypages do
  link "マイページ",mypage_path(current_user)
  parent :root
end

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
