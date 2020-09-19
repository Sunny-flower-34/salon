json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.user_name @message.user.username
json.user_id @message.user.id
json.currentuser_id @currentuser_id
json.userimg @userimg
json.content @message.content
json.image @message.image_url