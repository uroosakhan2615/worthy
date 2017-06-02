<%@ taglib prefix="s" uri="/struts-tags" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Transparent Search Box - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .search-background img {
    width: 100%;
}
.well-searchbox {
  min-height: 20px;
  min-width: 400px;
  padding: 19px;
  position: absolute;
  z-index: 80;
  top: 90px;
  right: 100px;
  background: rgba(0, 0, 0, 0.6);
  margin-bottom: 20px;
  border: 1px solid #e3e3e3;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
}

.well-searchbox label {
    color: #fff;
}
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
</head>
<body  background="images/searchBg.jpg">
		<div class="search-background">
            <img src="images/searchBg.jpg">
        </div>
		            <div class="well-searchbox">

				<s:if test="%{#msg != ''}">
					<div class="alert alert-success"><p>${msg}</p></div>
				</s:if>

		<form class="form-horizontal" action="searchMarquee" method="post">
                    <div class="form-group">
                        <label class="col-md-4 control-label">ID</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" placeholder="" name="searhBean.id">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">Event type </label>
                        <div class="col-md-8">
                            <select class="form-control" name="searhBean.eventType">
							<option value="">	 </option>
								<option value="Marriage">Marriage Ceremony</option>
								<option value="Birthday">Birthday Parties</option>
								<option value="political">political events</option>
							</select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">Capacity</label>
                        <div class="col-md-8">
                            <select class="form-control" name="searhBean.capacity">
                             <option value="">Enter capacity </option>
                                <option value="500"><500 to 1000</option>
                                <option value="2000">2000 to 3000</option>
                                <option value="4000">4000 to 5000</option>
                                 <option value="5000">above 5000</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">City</label>
                        <div class="col-md-8">
                            <select class="form-control" name="searhBean.city">
                            <option disabled value="Select Item" value="">"" </option>
                            <option value="Islamabad">select city</option>
                                <option value="Islamabad">Islamabad</option>
                                <option value="Lahore">Lahore</option>
                                <option value="Rawalpindi">Rawalpindi</option>
                                <option value="Faislabad">Faislabad </option>
                            </select>
                        </div>
                    </div>
                     
                    <div class="col-sm-offset-4 col-sm-5">
                        <button type="submit" class="btn btn-success">Search</button>
                    </div>
                </form>
            </div>
            
	
<script type="text/javascript">

</script>
</body>
</html>