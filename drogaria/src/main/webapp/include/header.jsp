<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String contextPath = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="<%= contextPath %>/util/style.css">

<title>Farmácia Bem-estar</title>
<link rel="icon" type="image/x-icon" href="<%= contextPath %>/images/favicon.ico">

</head>
<body>
	<%@ page import="br.edu.ifsp.arq.model.Administrador" %>

	<header>
	  <nav class="navbar navbar-expand-lg navbar-dark bg-cyan">
	    <div class="container">
	
	      <!-- LOGO -->
	      <a class="navbar-brand d-flex align-items-center" href="<%= contextPath %>/index.jsp">
	        <img src="<%= contextPath %>/images/logo.png" alt="Logo" style="height: 50px; margin-right: 10px;">
	      </a>
	
	      <!-- BOTÃO COLAPSÁVEL (MOBILE) -->
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
	        aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	
	      <!-- CONTEÚDO DA NAVBAR -->
	      <div class="collapse navbar-collapse" id="navbarContent">
	
	        <!-- BARRA DE BUSCA -->
	        <%
			  boolean usuarioLogado = session.getAttribute("usuarioLogado") != null;
			  String larguraBusca = usuarioLogado ? "300px" : "600px";
			%>
	        <form action="<%= contextPath %>/buscar-medicamento" method="get" class="form-inline mx-auto my-2 my-md-0" style="max-width: <%= larguraBusca %>; width: 100%;">
	          <div class="input-group w-100">
	            <input name="search" class="form-control rounded-left" type="search" placeholder="Buscar" aria-label="Buscar" minlength="3" required>
	            <div class="input-group-append">
	              <button class="btn btn-light rounded-right" type="submit">
	                <i class="fas fa-search"></i>
	              </button>
	            </div>
	          </div>
	        </form>
	
	        <!-- MENU -->
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item mx-1">
	            <a class="nav-link text-white font-weight-bold" href="<%= contextPath %>/index.jsp"><i class="fas fa-home"></i> Início</a>
	          </li>
	
	          <li class="nav-item mx-1">
	            <a class="nav-link text-white font-weight-bold" href="<%= contextPath %>/public/sobre.jsp"><i class="fas fa-info-circle"></i> Sobre</a>
	          </li>
	
	          <% if (session.getAttribute("usuarioLogado") != null) {
	               Administrador usuario = (Administrador) session.getAttribute("usuarioLogado");
	          %>
	            <li class="nav-item dropdown mx-1">
	              <a class="nav-link dropdown-toggle text-white font-weight-bold" href="#" id="navbarDropdownRemedio" role="button"
	                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-pills mr-1"></i> Medicamentos
	              </a>
	              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
		              <a class="dropdown-item" href="<%= contextPath %>/medicamento/form-medicamento.jsp">Adicionar novo remédio</a>	           
		              <div class="dropdown-divider"></div>
		              <a class="dropdown-item" href="<%= contextPath %>/medicamento/listar-medicamentos.jsp">Ver todos</a>
	              </div>
	            </li>
	
	            <li class="nav-item dropdown mx-1">
	              <a class="nav-link dropdown-toggle text-white font-weight-bold" href="#" id="navbarDropdown" role="button"
	                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-user mr-1"></i> <%= usuario.getNome() %>
	              </a>
	              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
	                <a class="dropdown-item" href="<%= contextPath %>/adm/editar-adm.jsp">Meus dados</a>
	                <div class="dropdown-divider"></div>
	                <a class="dropdown-item text-danger" href="#" id="btnLogout">Sair</a>


	              </div>
	            </li>
	          <% } else { %>
	            <li class="nav-item mx-1">
	              <a class="nav-link text-white font-weight-bold" href="<%= contextPath %>/public/login.jsp">
	                <i class="fas fa-user"></i> Login
	              </a>
	            </li>
	          <% } %>
	        </ul>
	      </div>
	    </div>
	  </nav>
	
	  <!-- MENSAGEM ALERTA -->
	  <c:if test="${not empty mensagem}">
	    <div class="${classAlert} text-center pt-3" role="alert">
	      <p>${mensagem}</p>
	    </div>
	  </c:if>
	</header>
