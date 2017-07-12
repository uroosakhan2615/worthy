<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Oops! Unauthorized Access</title>
<!-- Tell the Marquees_ name to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="styles.jsp"></jsp:include>

<style>

  html{
  }
  body{
      margin: 0;
      padding: 0;
      background: #e7ecf0;
      font-family: Arial, Helvetica, sans-serif;
  }
  *{
      margin: 0;
      padding: 0;
  }
  p{
      font-size: 12px;
      color: #373737;
      font-family: Arial, Helvetica, sans-serif;
      line-height: 18px;
  }
  p a{
      color: #218bdc;
      font-size: 12px;
      text-decoration: none;
  }
  a{
      outline: none;
  }
  .f-left{
      float:left;
  }
  .f-right{
      float:right;
  }
  .clear{
      clear: both;
      overflow: hidden;
  }
  #block_error{
      width: 845px;
      height: 384px;
      border: 1px solid #cccccc;
      margin: 72px auto 0;
      -moz-border-radius: 4px;
      -webkit-border-radius: 4px;
      border-radius: 4px;
      background: #fff url(http://www.ebpaidrev.com/systemerror/block.gif) no-repeat 0 51px;
  }
  #block_error div{
      padding: 100px 40px 0 186px;
  }
  #block_error div h2{
      color: #218bdc;
      font-size: 24px;
      display: block;
      padding: 0 0 14px 0;
      border-bottom: 1px solid #cccccc;
      margin-bottom: 12px;
      font-weight: normal;
  }

</style>

</head>
<body class="hold-transition skin-blue sidebar-mini">

	<div class="container">
		<div id="block_error">
			<div>
				<h2>Error 403. &nbspOops Unauthorized access!</h2>
				<h4>
					It appears that you are not allowed to see the requested resource/page.<br />	
				</h4>
				<p>
					If you are the owner of this page and are seeing this
					error, please <a
						href="#">contact us.</a>.
					If you have any questions, please contact our Technical Support
					department.
				</p>
				
				<a href="worthy" class="btn btn-lg btn-default">Go Home</a>
			</div>
		</div>
	</div>
</body>
</html>