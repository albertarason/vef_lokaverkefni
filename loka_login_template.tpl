<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <title>Login</title>
		<link rel="stylesheet" href="/static/css/loka_login.css">
    </head>
    <body>
        <form method="post" action="/login">
			<legend>Login</legend>
			% if "error" in locals():
			<p>Error: {{error}}</p>
			% end
            <input type="text" name="username" placeholder="Username"/>
            <input type="password" name="password" placeholder="Password" />
			<input type="submit">
        </form>
    </body>
</html>