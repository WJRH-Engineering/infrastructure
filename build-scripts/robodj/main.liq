#!/usr/bin/liquidsoap

%include "passwords.liq"

randomized_playlist = playlist(mode='randomize', reload=1, reload_mode='rounds')

def log_track(m) =
  artist = m["artist"]
  title = m["title"]
  print("Now Playing: #{artist} - #{title}")
end

# Setup sources

# Playlist of station IDs, to be played at the top of the hour
# Try to get a guests and performers to record these whenever possible
station_ids = randomized_playlist('/media/station-ids')

# WJRH's "default" robodj playlist
# this is what will usually be playing on robodj
default = randomized_playlist('/media/songs')

# Assign time slots for each of the playlists above here
# currently very short since there is only one playlist
programming = switch([
	({true}, default)
])

radio = switch([
	(predicate.activates({0m or 30m}), station_ids),
	({true}, programming)
])

# Log the track whenever a new one starts playing
radio = on_track(id="main", log_track, radio)

# Use replay gain data to set level for current song
radio = amplify(1.,override="replay_gain",radio)

radio = mksafe(radio)

# Hijack Stream
# Setup the ability to hijack the broadcast with an icecast mountpoint
hijack = strip_blank(
	max_blank=10.,
	input.http("http://www.wjrh.org:8000/hijack")
)

# Icecast output settings
# Currently used to make robodj metadata accessible to the webserver
output.icecast(%mp3,
	host="api.wjrh.org",
	port=8000,
	password=icecast_password,
	name="WJRH-RoboDJ",
	description="WJRH 104.9FM - Lafayette College Radio Online at wjrh.org. This is the Robo DJ stream. If you really like WJRH but really don't like our human DJs, you might be robot. This is the stream for you.",
	genre="College Radio",
	url="wjrh.org",
	mount="RoboDJ",
	stream
)
