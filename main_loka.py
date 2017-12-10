from bottle import *

users_secret = "Yb89BhFxgSEIiVFg5CZI"

@route("/")
def main():
	username_cookie = request.get_cookie("username", secret=users_secret)
	password_cookie = request.get_cookie("password", secret=users_secret)

	if username_cookie and password_cookie:
		redirect("/loka_to_do_list")
	else:
		return template("loka_login_template")

@route("/login", method="post")
def login():
	username = request.forms.get("username")
	password = request.forms.get("password")
	if username is not None and password is not None:
		if username == "admin1" and password == "adminpass":
			response.set_cookie("username", username, secret=users_secret)
			response.set_cookie("password", password, secret=users_secret)
			redirect("/loka_to_do_list")
		else:
			return template("loka_login_template", error="Username and/or password incorrect")
	redirect("/")

@route("/loka_to_do_list")
def secret():
	username = request.get_cookie("username", secret=users_secret)
	password = request.get_cookie("password", secret=users_secret)
	if username is not None and password is not None:
		if username == "admin1" and password == "adminpass":
			return template("loka_to_do_list")
	redirect("/")

@route("/logout")
def logout():
	response.delete_cookie("username", secret=users_secret)
	response.delete_cookie("password", secret=users_secret)
	redirect("/")

@route("/static/css/<filename:re:.*\.css>")
def send_css(filename):
    return static_file(filename, root='static/css')


run(host='localhost', port=8080)