<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.cyyself.game2048.model.Board" %>
<%@ page import="org.cyyself.game2048.model.UserScore" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>2048</title>
    <link href="style/main.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="apple-touch-icon" href="meta/apple-touch-icon.png">
    <link rel="apple-touch-startup-image" href="meta/apple-touch-startup-image-640x1096.png" media="(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)"> <!-- iPhone 5+ -->
    <link rel="apple-touch-startup-image" href="meta/apple-touch-startup-image-640x920.png"  media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 2)"> <!-- iPhone, retina -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="width=device-width, target-densitydpi=160dpi, initial-scale=1.0, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
    <div class="container">
        <div class="heading">
            <h1 class="title">2048</h1>
        </div>
        正在同步数据，请稍候

    </div>
    <script src="js/jquery.min.js"></script>
    <script>
        jQuery.ajax({
            type: 'GET',
            url: 'GetData',
            success: function(data){
                if (data.status === 0) {
                    var localStorageSupported = function () {
                        var testKey = "test";
                        try {
                            var storage = window.localStorage;
                            storage.setItem(testKey, "1");
                            storage.removeItem(testKey);
                            return true;
                        } catch (error) {
                            return false;
                        }
                    };
                    var storage = localStorageSupported ? window.localStorage : window.fakeStorage;
                    storage.setItem("bestScore",data.bestScore);
                    storage.setItem("gameState",data.gameState);
                }
                else alert(data.msg);
                location.reload();
            },
            dataType: 'json',
            error: function(){
                alert("更新状态失败");
                location.reload();
            }
        });
    </script>
</body>
</html>
