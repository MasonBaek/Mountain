<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
button {
	background-color: #04AA6D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

#cancel {
	padding: 14px 20px;
	background-color: #f44336;
}
</style>
</head>
<body>
<h1>Join Us</h1>
	<form action="" id="join">
		<fieldset>
			<legend>Basic Info</legend>
			<label>User ID</label> <input type="text" name="id" class="id">
			<input type="button" value="dup. check" class="dup"><br>
			<label>Password</label> <input type="password" name="pass"><br>
			<label>Retype Password</label> <input type="password" name="pass2"><br>
			<label>Name</label> <input type="text" name="name"><br>
			<label>E-Mail</label> <input type="email" name="email"><br>
			<label>Retype E-Mail</label> <input type="email" name="email2"><br>
		</fieldset>

		<fieldset>
			<legend>Optional</legend>
			<label>Address</label> <input type="text" name="address"><br>
			<label>Phone Number</label> <input type="text" name="phone"><br>
			<label>Mobile Phone Number</label> <input type="text" name="mobile"><br>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons">
			<input type="submit" value="Submit" class="btn_submit">
			<input type="reset" value="ÃÊ±âÈ­" class="cancel">
		</div>
	</form>
</body>
</html>