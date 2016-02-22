json.array!(@members) do |member|
  json.extract! member, :id, :name, :email, :password, :social_media_connected, :social_profile, :number_of_uploads
  json.url member_url(member, format: :json)
end
