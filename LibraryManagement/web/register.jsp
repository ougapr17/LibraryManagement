<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户注册</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1, h2 {
            text-align: center;
        }

        form {
            width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }
        tr {
            font-size: 20px;
        }

        table tr td {
            padding: 5px;
            border-bottom: 1px solid #ccc;
        }

        input[type="text"],
        input[type="password"] {
            width: 95%;
            padding: 5px;
            font-size: 18px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        a {
            color: #4CAF50;
        }
    </style>
</head>
<body>

    <form action="register" method="post" name="registerForm">
        <h1>用户注册</h1>
        <hr/>
        <div>
            <tr>
                <label>您的账号：</label>
                <input type="text" name="name" id="name" placeholder="请输入用户名">
            </tr>
        </div>
        <div>
            <tr>
                <label>您的密码：</label>
                <input type="password" name="password" id="password" placeholder="请输入密码">
            </tr>
        </div>
        <div>
            <tr>
                <label>确认密码：</label>
                <input type="password" name="relpassword" id="relpassword" placeholder="请确认密码">
            </tr>
        </div>
        <div>
            <tr>
                <label>电话号码：</label>
                <input type="text" name="phone" id="phone" placeholder="请输入电话号码">
            </tr>
        </div>
        <div>
            <tr>
                <label>电子邮件：</label>
                <input type="text" name="email" id="email" placeholder="请输入电子邮件">
            </tr>

        </div>
        <hr/>
        <div>
            <tr>
                <td colspan="1"></td>
                <td>
                    <button type="submit" onclick="return checkForm()">注册</button>
                    <button type="reset">重置</button>
                    <a href="login.jsp" target="_blank">登录</a>
                </td>
            </tr>
        </div>
    </form>

    <script type="text/javascript">
        function checkForm() {
            var name = registerForm.name.value;
            var pwd = registerForm.password.value;
            var repwd = registerForm.relpassword.value;
            //alert(name + pwd + repwd);
            if (name == "" || name == null) {
                alert("请输入用户名");
                registerForm.name.focus();
                return false;
            } else if (pwd == "" || pwd == null) {
                alert("请输入密码");
                registerForm.password.focus();
                return false;
            } else if (repwd == "" || repwd == null) {
                alert("请输入确认密码");
                registerForm.relpassword.focus();
                return false;
            } else if (pwd != repwd) {
                alert("两次密码输入不一致，请重新输入!");
                registerForm.relpassword.focus();
                return false;
            }
            alert('注册成功！');
            return true;
        }
    </script>
</body>
</html>