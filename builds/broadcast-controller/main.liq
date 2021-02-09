%include "/secrets/passwords.liq"

# sources
studio = input.http("http://wjrh.org:8000/WJRH")
studio = strip_blank(max_blank=10.0, studio)

remote_shows = input.http("http://remote.wjrh.org:8000/remote-studio")
remote_shows = strip_blank(max_blank=10.0, remote_shows)

robodj = input.http("http://api.wjrh.org:8000/RoboDJ")
robodj = strip_blank(max_blank=10.0, robodj)

backup = playlist("/backup")

default = fallback(track_sensitive = false, [
	studio,
	remote_shows,
	robodj,	
	backup
])

output.icecast(%mp3,
	host="api.wjrh.org",
	port=8000,
	password="hogghall",
	name="Broadcast",
	description="",
	mount="broadcast",
	mksafe(default)
)
