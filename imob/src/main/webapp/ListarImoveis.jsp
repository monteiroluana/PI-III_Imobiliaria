<%-- 
    Document   : listarImoveis
    Created on : May 4, 2018, 3:58:12 PM
    Author     : I864970
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Imóveis</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script>

    </head>
    <body>
        <div w3-include-html="menu.html"></div>
        <script>
            w3IncludeHTML();
        </script>

        <div class="main">
            <div class="container">
                <div class="row centered-form">
                    <div >
                        <br>
                        <br>
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Consultar Imóveis</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form">
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <h3 class="panel-title">Filtrar busca</h3>
                                        </div>
                                        <hr>
                                    </div>
                                    <div class="row">

                                        <div class="col-xs-auto col-sm-auto col-md-4">

                                            <div id="custom-search-input">
                                                <div class="input-group col-md-12">
                                                    <input type="text" class="form-control input-sm" placeholder="digite o cód. do imóvel" id="codImovel" name="codImovel" />
                                                    <span class="input-group-btn">
                                                        <!--<button class="btn btn-info btn-sm" type="button" id="PesquisaNome">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>-->
                                                        <a href="#" class="btn btn-info" onclick="this.href = 'imovel?comando=lista&codImov=' + document.getElementById('codImovel').value">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="tipo">Tipo do imóvel</label>
                                                </div>	
                                                <select id="tipo" name="tipo" class="form-control">
                                                    <option value="">Selecione</option>
                                                    <option value="casa">Casa</option>
                                                    <option value="apartamento">Apartamento</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="situacao">Status do imóvel</label>
                                                </div>	
                                                <select id="situacao" name="situacao" class="form-control">
                                                    <option value="">Selecione</option>
                                                    <option value="livre">Livre</option>
                                                    <option value="ocupado">Ocupado</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="min">Faixa de preço</label>
                                                </div>
                                                <input type="text" name="min" id="min" class="form-control input-sm" placeholder="menor valor">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label for="pesquisar">&nbsp;</label>
                                                </div>
                                                <input type="text" name="max" id="max" class="form-control input-sm" placeholder="maior valor">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="servico">Serviço</label>
                                                    <select id="servico" name="servico" class="form-control">
                                                        <option value="">Selecione</option>
                                                        <option value="venda">Venda</option>
                                                        <option value="locacao">Locação</option>                                                    
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-1">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="uf">UF</label>
                                                    <select id="uf" name="uf" class="form-control" style="width: auto">
                                                        <option value="ac">AC</option>
                                                        <option value="al">AL</option>
                                                        <option value="ap">AP</option>
                                                        <option value="am">AM</option>
                                                        <option value="ba">BA</option>
                                                        <option value="ce">CE</option>
                                                        <option value="df">DF</option>
                                                        <option value="es">ES</option>
                                                        <option value="go">GO</option>
                                                        <option value="ma">MA</option>
                                                        <option value="mt">MT</option>
                                                        <option value="ms">MS</option>
                                                        <option value="mg">MG</option>
                                                        <option value="pa">PA</option>
                                                        <option value="pb">PB</option>
                                                        <option value="pr">PR</option>
                                                        <option value="pe">PE</option>
                                                        <option value="pi">PI</option>
                                                        <option value="rj">RJ</option>
                                                        <option value="rn">RN</option>
                                                        <option value="rs">RS</option>
                                                        <option value="ro">RO</option>
                                                        <option value="rr">RR</option>
                                                        <option value="sc">SC</option>
                                                        <option value="sp">SP</option>
                                                        <option value="se">SE</option>
                                                        <option value="to">TO</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-1">
                                            <div class="col-25">
                                                <label for="pesquisar">&nbsp;</label>
                                            </div>

                                            <!--<button class="btn btn-info btn-sm" type="button" id="pesquisar">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>-->

                                            <span class="input-group-btn">
                                                <a href="#" class="btn btn-info" onclick="this.href = 'imovel?comando=lista&codImov=' + document.getElementById('codImovel').value +
                                                                '&tip=' + document.getElementById('tipo').value +
                                                                '&situ=' + document.getElementById('situacao').value +
                                                                '&vInicial=' + document.getElementById('min').value +
                                                                '&vFinal=' + document.getElementById('max').value +
                                                                '&serv=' + document.getElementById('servico').value +
                                                                '&est=' + document.getElementById('uf').value">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </a>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-auto">
                                            <table class="table table-striped custab">
                                                <thead>
                                                    <tr>
                                                        <th>Cód. Imóvel</th>
                                                        <th>Tipo do imóvel</th>
                                                        <th>Bairro</th>
                                                        <th>Cidade</th>
                                                        <th>Estado</th>
                                                        <th>Valor</th>
                                                        <th>Situação</th>
                                                        <th class="text-center">Opções</th>
                                                    </tr>
                                                </thead>

                                                <c:forEach items="${lista}" var="i">
                                                    <tr>
                                                        <td><c:out value="${i.codImovel}"/></td>
                                                        <td><c:out value="${i.tipo}" /></td>
                                                        <td><c:out value="${i.bairro}" /></td>
                                                        <td><c:out value="${i.cidade}" /></td>
                                                        <td><c:out value="${i.uf}" /></td>
                                                        <td><c:out value="${i.valorVenda}" /></td>
                                                        <td><c:out value="${i.situacao}" /></td>
                                                    <input style="display: none" value="${i.idImovel}"/>                                                     

                                                    <td class="text-center">
                                                        <a href="imovel?idImovel=${i.idImovel}&comando=listaEditar"class="btn btn-info btn-sm" target="_blank">Editar</a>
                                                        <!-- <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerModal">Deletar</button> -->
                                                        <a href="imovel?idImovel=${i.idImovel}&comando=excluir"class="btn btn-danger btn-sm">Excluir</a>
                                                    </td>
                                                    </tr>

                                                </c:forEach>

                                            </table>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>	
            </div>

        </div> <!-- MAIN -->
    </body>
</body>
</html>
