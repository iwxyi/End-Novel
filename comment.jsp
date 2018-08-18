<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>书评管理</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="favicon_16.ico"/>
    <link rel="bookmark" href="favicon_16.ico"/>
    <!-- site css -->
    <link rel="stylesheet" href="dist/css/site.min.css">

  <link rel="stylesheet" href="css/mdui.min.css" />
    <script src="js/mdui.min.js"></script>
    <script src="js/yunj.js"></script>
    <link rel="stylesheet" href="css/yunj.css" />
    <link rel="stylesheet" href="css/register.css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/register.js"></script>
    <script src="js/functions.js"></script>

    <script type="text/javascript" src="dist/js/site.min.js"></script>
  </head>
  <body class="mdui-appbar-with-toolbar">

  <%@include file="UIframe/UIframe.jsp" %>

    <div class="container-fluid">
    <!--documents-->
        <div class="row row-offcanvas row-offcanvas-left">

          <div class="col-xs-12 col-sm-9 content">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="content-row">
                    <h2 class="content-row-title">书评</h2>
                        <div class="row">
                          <div class="col-md-12">
                            <div class="timeline">
                              <dl>
                                <dt>Apr 2018</dt>
                                <dd class="pos-right clearfix">
                                  <div class="circ"></div>
                                  <div class="time">Apr 14</div>
                                  <div class="events">
                                    <div class="pull-left">
                                      <img class="events-object img-rounded" src="dist/img/photo-1.jpg">
                                    </div>
                                    <div class="events-body">
                                      <h4 class="events-heading">黄家慧</h4>
                                      <p>“你以后走路能不能看着点啊。”“非要撞在我心上。”</p>
                                    </div>
                                  </div>
                                </dd>
                                <dd class="pos-left clearfix">
                                  <div class="circ"></div>
                                  <div class="time">Apr 10</div>
                                  <div class="events">
                                    <div class="pull-left">
                                      <img class="events-object img-rounded" src="dist/img/photo-2.jpg">
                                    </div>
                                    <div class="events-body">
                                      <h4 class="events-heading">王鑫益</h4>
                                      <p>“你这么完美，就是有一个缺点。”“什么缺点？”“缺点我”</p>
                                    </div>
                                  </div>
                                </dd>
                                <dt>Mar 2018</dt>
                                <dd class="pos-right clearfix">
                                  <div class="circ"></div>
                                  <div class="time">Mar 15</div>
                                  <div class="events">
                                    <div class="pull-left">
                                      <img class="events-object img-rounded" src="dist/img/photo-3.jpg">
                                    </div>
                                    <div class="events-body">
                                      <h4 class="events-heading">顾林伟</h4>
                                      <p>“喜欢你是件很麻烦的事。”“但我偏偏喜欢找麻烦。”</p>
                                    </div>
                                  </div>
                                </dd>
                                <dd class="pos-left clearfix">
                                  <div class="circ"></div>
                                  <div class="time">Mar 8</div>
                                  <div class="events">
                                    <div class="pull-left">
                                      <img class="events-object img-rounded" src="dist/img/photo-4.jpg">
                                    </div>
                                    <div class="events-body">
                                      <h4 class="events-heading">蒋阳名</h4>
                                      <p>“我有一个人生建议会让你受益一生哦！”“什么人生建议啊。”“这辈子和我在一起。”</p>
                                    </div>
                                  </div>
                                </dd>

                              </dl>
                            </div>
                          </div>
                       </div>
                    </div>
              </div><!-- panel body -->
            </div>
        </div><!-- content -->
      </div>
    </div>
    
  </body>
</html>
