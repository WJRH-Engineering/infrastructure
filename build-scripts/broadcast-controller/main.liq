%include "/secrets/passwords.liq"

# init sources
hogg_studio = input.http("http://wjrh.org:8000/WJRH")
remote_studio = input.http("http://api.wjrh.org:8000/remote-studio")
robodj = input.http("http://api.wjrh.org:8000/RoboDJ")
backup = playlist("/backup")

# strip silence
studio = strip_blank(max_blank=10.0, studio)
remote_shows = strip_blank(max_blank=10.0, remote_shows)
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
	description="",
	mount="broadcast",
	mksafe(broadcast)
)
