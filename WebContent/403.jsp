<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Data Tables</title>
<!-- Tell the Marquees_ name to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
</head>
<body class="hold-transition skin-blue sidebar-mini">

<jsp:include page="styles.jsp"></jsp:include>
<div class="container">
    <div class="vtexIdUI-403 vtexIdUI-page" id="vtexIdUI-no-permission">
      <div class="modal-header">
        <h4><span class="vtexIdUI-heading">Você precisa de permissões</span> <small class="pull-right">Erro 403</small></h4>
      </div>
      
      <div class="alert alert-info alert-general alert-modal-body clearfix">
        <i class="icon-frown icon-4x pull-left"></i>
        <p>Sua conta de email <strong>josedasilva@vtex.com.br</strong>You are not authorized to view this page.<br>
          <small>Tente entrar com outra conta de email ou falar com o suporte.</small>
        </p>
      </div>
      
        <div class="modal-footer">
          <a class="vtexIdUI-back-link pull-left dead-link" href="#" data-i18n="vtexid.backLink" ng-click="updatePage('auth-selector')"><i class="icon-arrow-left"></i> Voltar</a>
          <button class="btn pull-right btn-large" type="submit" data-i18n="vtexid.send">Sair</button>
        </div>
    </div>
</div>
</body>
</html>