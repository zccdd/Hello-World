<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/5/19
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn" class="skin-light">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>留言板</title>
    <meta name="description" content="" />
    <link rel="apple-touch-icon" href="//qzonestyle.gtimg.cn/qzone/v8/index/touch-icon-ipad-retina.png">
    <link rel="apple-touch-icon" sizes="76x76" href="//qzonestyle.gtimg.cn/qzone/v8/index/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="//qzonestyle.gtimg.cn/qzone/v8/index/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="//qzonestyle.gtimg.cn/qzone/v8/index/touch-icon-ipad-retina.png">
    <link rel="icon" sizes="any" mask href="//qzonestyle.gtimg.cn/qzone/v8/img/Qzone.svg">
    <meta name="theme-color" content="#FFC028">
    <link href="//qzonestyle.gtimg.cn/aoi/old-qz_qzone_lv.css" rel="stylesheet" />
    <link href="//qzonestyle.gtimg.cn/aoi/skin/35.css" rel="stylesheet"/>
    <link href="//qzonestyle.gtimg.cn/aoi/profile-v9.css" rel="stylesheet"/>
    <style type="text/css">
        *{margin: 0px;padding: 0px;}
        #QModal{border: 1px solid #ddd;position: absolute; }
        #wxtishi{position: absolute;right: 15px;bottom: 0px;}
    </style>
    <style id="mainJSBg" type="text/css">
        .background-container{
            background-repeat:no-repeat;
            background-position:center top;
            background-attachment:scroll;
            background-image:url(/img/99.png);
        }
        .bg-body{
            background-image:url(/img/69.jpg); background-repeat:repeat-y;background-size:contain;}
        .layout-nav{background-image: url(//i.gtimg.cn/qzone/space_item/orig/2/94786_menu_bg.png);_background-image: url(//i.gtimg.cn/qzone/space_item/orig/2/94786_menu_bg_ie6.png);border: none;}
        .layout-background{background-image:url(//i.gtimg.cn/qzone/space_item/orig/2/94786_bg1.png); background-repeat:repeat;}
    </style>
    <style id="mainJSTitleBar" type="text/css">
        .layout-head-inner {
            height:250px;
        }
    </style>
    <style type="text/css">
    </style>
    <style type="text/css" id="dynamicStyle">
        .ownermode{display:;}
        .clientmode{display:none;}
        .editmode{display:none;}
        .customoff{display:;}
        .alphamode{display:none;}
    </style>
    <link rel="Shortcut Icon" href="../img/icon.jpg" type="image/x-icon" />
</head>
<body class="os-win7 bg-body mode-theme">
<div class="top-fix-bar">
    <div class="top-fix-inner" >
        <div class="top-fix-container" id="QZ_Toolbar_Container">
            <div class="top-fix-wrap">

            </div>
        </div>
    </div>
</div>


<div class="background-container" id="layBackground">
    <div class="layout-content">

        <div class="layout-head  anti-color">

            <div class="layout-head-inner" id="headContainer">

                <div class="head-info">
                    <h1 class="head-title" id="top_head_title"><span class="title-text">我们的故事</span>

                    </h1>
                    <div class="head-description">
                        <span class="description-text" id="QZ_Space_Desc"></span>
                    </div>
                </div>
                <div class="head-detail">
                    <div class="head-detail-name">
                        <span class="user-name textoverflow">&nbsp;${user.userName}&nbsp;${user.sex==1?"Mr.":"Ms."}</span>
                    </div>
                </div>
                <!--挂件-->
                <div class="layout-shop-item" id="QZ_Shop_Items_Container">
                    <div class="shop-item cs" id="menuContainer" style="width: 1px; height: 32px; left: 150px; top: 252px; ">
                        <div class="head-nav"><ul class="head-nav-menu">
                            <li class="menu_item_N1"><span class="arr"></span><a href="/msgList" title="主页" tabindex="1" accesskey="z">主页</a></li>
                            <li class="menu_item_334"><span class="arr"></span><a href="/logout" title="注销" tabindex="1">注销</a></li>
                            <li class="menu_item_334"><span class="arr"></span><a href="javascript:love();" title="按着玩的" tabindex="1" >按着玩的</a></li>
                        </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layout-nav">
            <div class="layout-nav-inner">
                <div class="head-avatar">
                    <a id="QM_OwnerInfo_ModifyIcon" title="修改头像" href="javascript:upload();"><img src=${user.urlpath} class="user-avatar" id="QM_OwnerInfo_Icon"></a>
                </div>
            </div>
        </div>
        <div class="layout-background">

            <div class="layout-body">

                <div id="pageContent" class="qz-grid none">
                </div>


                <div id="pageApp" class="layout-app mod_wrap">
                    <div class="mod_wrap_inner">
                        <div class="mod_wrap_bd">
                            <div class="mod_wrap_iframe" id="app_container" style="min-height:435px;">
                                <div id="div1" style="max-width:860px;margin:auto;background: white;border: 1px solid gainsboro;padding: 20px;">
                                    <div>
                                        <form action="/addMsg" method="post">
                                            <input name="userName" value="${user.userName}" hidden/>
                                            <input name="message" /><input type="submit" value="留言" />
                                        </form>
                                    </div>
                                    <c:forEach var="i" begin="0" end="${msgList.size()-1}" step="1">
                                        <div style="margin-top: 20px;">
                                            <div style="margin-bottom: 20px;border-top: 1px solid gainsboro;"></div>
                                            <div style="float: left"><img src="${msgList[i].urlpath}" height="50px" width="50px"></div>
                                            <div style="margin-left: 75px">
                                                <a>${msgList[i].userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: darkgray">第${msgList[i].id}楼</span><br/><br/>
                                                    ${msgList[i].message}<br/><br/><br/><br/>
                                                    ${msgList[i].current}
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="page3rdApp" class="layout-app none" style="min-height:750px;"></div>
            </div>
            <div class="layout-copyright">
                <p>Copyright &copy; 2018 - A Long.<a>I Love DD.</a></p>
                <p>这是兜兜的 版权所有</p>
            </div>
        </div>
    </div>
</div>
<div class="fix-layout">
    <div class="gb-operation-area" id="_returnTop_layout_inner">
        <a href="#layBackground" id="goto_top_btn" class="gb-operation-button return-top">
            <i class="gb-operation-icon" title="返回顶部"></i>
            <span class="gb-operation-text">顶部</span>
        </a>
    </div></div>
<script type="text/javascript" src="https://qzonestyle.gtimg.cn/ac/qzone/qzfl/qzfl_v8_2.1.65.js" ></script>
<script type="text/javascript" src="https://qzonestyle.gtimg.cn/ac/lib/seajs/sea-2.1.2.js" ></script>
<script type="text/javascript" src="https://qzonestyle.gtimg.cn/c/=/qzone/v8/core/seajs_config.js,/qzone/v8/engine/plugin-combo.js?max_age=31536001" ></script>
<script type="text/javascript" src="https://qzonestyle.gtimg.cn/qzone/v8/core/app.js" ></script>
<div id="file" hidden>
    <form action="/uploadFile" method="post" enctype="multipart/form-data">
        <input name="id" value="${user.id}" hidden/>
        <input name="userName" value="${user.userName}" hidden/>
        <input name="passWord" value="${user.passWord}" hidden/>
        <input name="sex" value="${user.sex}" hidden/>
        <input name="age" value="${user.age}" hidden/>
        <input type="file" name="file"><input type="submit" value="确定"><br/><br/>
        <span style="color: darkred">注：1.先选择文件再确定，2.图片大小不得超过1M</span>
    </form>
</div>
</body>
<script type="text/javascript">
    function love(){
        $.ajax({
            url : '/QRcode',
            success : function(imgUrl) {
                if ($("#QModal").length > 0 ){
                    $("#QModal").remove();
                    return false;
                }
                var oLogin=$('<div id="QModal"><img src="'+imgUrl+'"/><span id="wxtishi">请使用微信扫码</span></div>');
                $('body').append(oLogin);
                oLogin.css('left',($(window).width()-oLogin.outerWidth())/2);//是弹窗能够出现在浏览器的中间
                oLogin.css('top',300);
            },
            error :function(){
            },
            complete : function() {
            }
        });
    }

    function upload(){
        $("#div1").html($("#file").show())
    }
</script>
</html>
