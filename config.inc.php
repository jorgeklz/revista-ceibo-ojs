; <?php exit(); // DO NOT DELETE ?>
; DO NOT DELETE THE ABOVE LINE!!!
; Doing so will expose this configuration file through your web site!

;;;;;;;;;;;;;;;;;;;;;;
; General Settings   ;
;;;;;;;;;;;;;;;;;;;;;;

[general]
installed = On
base_url = "http://localhost:8080"
trust_x_forwarded_for = On
session_cookie_name = OJSSID
session_lifetime = 30
default_locale = es_ES
time_zone = "UTC"
scheduled_tasks = Off
force_ssl = Off
disable_path_info = Off
allow_url_fopen = Off
date_format_short = "%Y-%m-%d"
date_format_long = "%B %e, %Y"
datetime_format_short = "%Y-%m-%d %I:%M %p"
datetime_format_long = "%B %e, %Y - %I:%M %p"
time_format = "%I:%M %p"

;;;;;;;;;;;;;;;;;;;;;
; Database Settings ;
;;;;;;;;;;;;;;;;;;;;;

[database]
driver = mysqli
host = ojs-db
username = ojs_user
password = ojs_password
name = ojs_db
persistent = Off
debug = Off

;;;;;;;;;;;;;;;;;;
; Files Settings ;
;;;;;;;;;;;;;;;;;;

[files]
files_dir = /var/www/files
public_files_dir = public
umask = 0022

;;;;;;;;;;;;;;;;;;;;;;
; Security Settings  ;
;;;;;;;;;;;;;;;;;;;;;;

[security]
force_ssl = Off
force_login_ssl = Off
session_check_ip = Off
encryption = sha1
salt = "UnaClaveLargaYSegura2026!!"
api_key_secret = ""
reset_seconds = 7200
allowed_html = "a[href|target|title],em,strong,cite,code,ul,ol,li[class],dl,dt,dd,b,i,u,img[src|alt],sup,sub,br,p"

;;;;;;;;;;;;;;;;;;;
; Email Settings  ;
;;;;;;;;;;;;;;;;;;;

[email]
default_envelope_sender = ""

;;;;;;;;;;;;;;;;;;
; Cache Settings ;
;;;;;;;;;;;;;;;;;;

[cache]

;;;;;;;;;;;;;;;;;;;;;
; i18n Settings     ;
;;;;;;;;;;;;;;;;;;;;;

[i18n]
locale = es_ES
client_charset = utf-8
connection_charset = utf8
database_charset = utf8

;;;;;;;;;;;;;;;;;
; OAI Settings  ;
;;;;;;;;;;;;;;;;;

[oai]
oai = On
repository_id = "ojs2.localhost:8080"

;;;;;;;;;;;;;;;;;
; Debug Settings ;
;;;;;;;;;;;;;;;;;

[debug]
show_stacktrace = On
display_errors = On
deprecation_warnings = Off