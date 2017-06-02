
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>RegistrationForm - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


 </head>
 <body>
 
<div class="container">
	<div class="row">
	<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Marquee Registration Form</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Name">Marquee_name</label>  
  <div class="col-md-5">
  <input id="Name" name="Name" type="text" placeholder="username" class="form-control input-md" required="">
    
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Marquee_id</label>
  <div class="col-md-5">
    <input id="passwordinput" name="passwordinput" type="number" placeholder="" class="form-control input-md" required="">
    <span class="help-block">max 16 characters</span>
  </div>
</div>
 
<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="address">Marquee Address</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="address" name="address">default text</textarea>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="country">city</label>
  <div class="col-md-5">
    <select id="city" name="city" class="form-control">
      <option value="India">Rawalpindi</option>
      <option value="Afghanistan">Islamabad</option>
      <option value="Aland Islands">Lahore</option>
      <option value="Algeria">Faislabad</option>
      <option value="">Murree</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="mobilenumber">Mobile Number</label>  
  <div class="col-md-5">
  <input id="mobilenumber" name="mobilenumber" type="text" placeholder="Mobile Number" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="emailId">Email Id</label>  
  <div class="col-md-6">
  <input id="emailId" name="emailId" type="text" placeholder="user@domain.com" class="form-control input-md" required="">
    
  </div>
</div>

 

<!-- Prepended checkbox -->
<div class="form-group">
  <label class="col-md-4 control-label" for="check_critiria">Check the box</label>
  <div class="col-md-6">
    <div class="input-group">
      <span class="input-group-addon">     
          <input type="checkbox">     
      </span>
      <input id="check_critiria" name="check_critiria" class="form-control" type="text" placeholder="I accept the criteria" required="">
    </div>
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-4">
    <button id="submit" name="submit" class="btn btn-success">Submit</button>
  </div>
</div>

</fieldset>
</form>
	</div>
</div>
<script type="text/javascript">
</script>
</body>
</html>
