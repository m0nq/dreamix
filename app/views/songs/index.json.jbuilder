json.array!(@songs) do |song|
  json.extract! song, :id, :artist, :title, :url, :duration, :format, :is_playing
  json.url song_url(song, format: :json)
end
