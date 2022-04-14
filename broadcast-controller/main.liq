%include "/secrets/passwords.liq"

# init sources
# hogg_studio = input.http("http://wjrh.org:8000/WJRH")
hogg_studio = input.http("http://api.wjrh.org:8000/board")
remote_studio = input.http("http://api.wjrh.org:8000/remote-studio")
robodj = input.http("http://api.wjrh.org:8000/RoboDJ")
backup = playlist("/backup")

# strip silence
studio = strip_blank(max_blank=10.0, hogg_studio)
remote_shows = strip_blank(max_blank=10.0, remote_studio)
robodj = strip_blank(max_blank=10.0, robodj)

# determine the broadcast
broadcast = fallback(track_sensitive = false, [
	studio,
	remote_shows,
	robodj,	
	backup
])

# output to icecast
output.icecast(%mp3,
	host="api.wjrh.org",
	port=8000,
	password=icecast_password,
	name="Broadcast",
	description="This stream represents the official broadcast of WJRH. It is played by both the website and pardee FM transmitter.",
	mount="broadcast",
	mksafe(broadcast)
)
