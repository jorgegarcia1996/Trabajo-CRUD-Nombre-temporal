<%-- 
    Document   : index.jsp
    Created on : 25-feb-2019, 11:35:54
    Author     : JorgeGarciaMolina
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
      
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/anime", "root", "root");
  Statement s1 = conexion.createStatement();
  Statement s2 = conexion.createStatement();
  Statement s3 = conexion.createStatement();
  Statement s4 = conexion.createStatement();
  Statement s5 = conexion.createStatement();
  Statement s6 = conexion.createStatement();
  Statement s7 = conexion.createStatement();
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CRUD Programación</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="./main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="./script.js"></script>
  </head>
  <%
    if(session.getAttribute("usuario") == null) {
      out.print("<script>"
                + "location.replace(\"index.jsp\");"
                + "</script>");
    }
  %>
  <body>
    <div class="container">
      <div class="table-wrapper">
        <div class="table-title">
          <div class="row">
            <div class="col-sm-6">
              <h3>CRUD <b>Anime</b></h3>
            </div>
            <div class="col-sm-6 text-right">
              <h3>Bienvenido, <b><%out.print(session.getAttribute("usuario"));%></b><a href="cerrar-sesion.jsp" class="btn btn-danger"><i class="material-icons">exit_to_app</i> Salir</a></h3>		
            </div>
          </div><br>
          <div class="row">
            <div class="col-sm-12">
              <div class="search-box">
                <div class="input-group">								
                  <input type="text" id="search" class="form-control" placeholder="Buscar por nombre">
                  <span class="input-group-addon buscar"><i class="material-icons">&#xE8B6;</i></span>
                </div>
              </div>
            </div>
          </div><br>
          <div class="row">
            <div class="col-sm-12">
              <a href="#agregarAnimeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Agregar Anime</span></a>		
            </div>
          </div>
        </div>
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>Codigo</th>
              <th>Nombre</th>
              <th class="justify-content-center">Nº Episodios</th>
              <th>Tipo</th>
              <th class="justify-content-center">Acciones</th>
            </tr>
          </thead>
          <tbody>
            <%
              ResultSet listado = s1.executeQuery("SELECT * FROM ANIME");
              while (listado.next()) {
                ResultSet tipo = s2.executeQuery("SELECT * FROM TIPO");
                session.setAttribute("codigoAnime", listado.getString("CodAni"));
                session.setAttribute("nombreAnime", listado.getString("NomAni"));
                session.setAttribute("sinopsisAnime", listado.getString("SinAni"));
                session.setAttribute("generoAnime", listado.getString("GenAni"));
                session.setAttribute("numeroEpisodiosAnime", listado.getString("NumEpiAni"));
                session.setAttribute("duracionEpisodioAnime", listado.getString("DurEpiAni"));
                session.setAttribute("fechaEstrenoAnime", listado.getString("FecEstAni"));
                session.setAttribute("estudioAnimacionAnime", listado.getString("EstAni"));
                session.setAttribute("codigoTipoAnime", listado.getString("CodTip"));
            %>
            <tr>
              <td><%= session.getAttribute("codigoAnime")%></td>
              <td width="50%"><%= session.getAttribute("nombreAnime")%></td>
              <td class="justify-content-center"><%= session.getAttribute("numeroEpisodiosAnime")%></td>
              <td>
              <%
                while(tipo.next()) {
                  session.setAttribute("codigoTipo", tipo.getString("CodTip"));
                  
                  if (session.getAttribute("codigoTipoAnime").equals(session.getAttribute("codigoTipo"))) {
                    session.setAttribute("nombreTipo", tipo.getString("NomTip"));
                    out.print(session.getAttribute("nombreTipo"));
                  }
                }
                %>
              </td>
              <td width="150px" class="justify-content-center">
                <!--Boton de Editar Anime-->
                <a href="#editarAnimeModal<%= session.getAttribute("codigoAnime")%>" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Editar">&#xE254;</i></a>
                <!-- Modal Editar Anime -->
                <div id="editarAnimeModal<%= session.getAttribute("codigoAnime")%>" class="modal fade">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <form action="actualizar.jsp" method="post">
                        <div class="modal-header">						
                          <h4 class="modal-title">Editar Anime</h4>
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	
                          <input type="hidden" name="actualizarAnime" value="<%= session.getAttribute("codigoAnime")%>">
                          <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" name="nombre" class="form-control" value="<%= session.getAttribute("nombreAnime")%>" required>
                          </div>
                          <div class="form-group">
                            <label>Tipo</label>
                            <select name="tipo" class="form-control" required>
                              <option value="<%= session.getAttribute("codigoTipoAnime")%>" selected="true"><%= session.getAttribute("nombreTipo")%></option>
                            <%
                              ResultSet tipo4 = s7.executeQuery("SELECT * FROM TIPO");
                              while (tipo4.next()) {
                                if (!session.getAttribute("codigoTipoAnime").equals(tipo4.getString("CodTip"))) {
                                  out.println("<option value=" + tipo4.getString("CodTip") + ">" + tipo4.getString("NomTip") + "</option>");
                                }
                              }
                            %>
                            </select>
                          </div>
                          <div class="form-group">
                            <label>Generos</label>
                            <input type="text" name="genero" class="form-control" value="<%= session.getAttribute("generoAnime")%>" required>
                          </div>
                          <div class="form-group">
                            <label>Sinopsis</label>
                            <textarea class="form-control" name="sinopsis" required><%= session.getAttribute("sinopsisAnime")%></textarea>
                          </div>
                          <div class="form-group">
                            <label>Numero de episodios</label>
                            <input type="number" class="form-control" min="1" step="1" name="numeroEpisodios" value="<%= session.getAttribute("numeroEpisodiosAnime")%>" required>
                          </div>
                          <div class="form-group">
                            <label>Duracion de los episodios (en minutos)</label>
                            <input type="number" class="form-control" name="duracionEpisodios" min="0" step="1" value="<%=session.getAttribute("duracionEpisodioAnime")%>" required>
                          </div>
                          <div class="form-group">
                            <label>Fecha de estreno</label>
                            <input type="date" class="form-control" name="fechaEstreno"  value="<%= session.getAttribute("fechaEstrenoAnime")%>" required>
                          </div>
                          <div class="form-group">
                            <label>Estudio</label>
                            <input type="text" name="estudio" class="form-control"  value="<%= session.getAttribute("estudioAnimacionAnime")%>" required>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                          <input type="submit" class="btn btn-info" value="Guardar Cambios">
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                
                <!--Boton de borrar anime-->
                <a href="#borrarAnimeModal<%= session.getAttribute("codigoAnime")%>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Borrar">&#xE872;</i></a>
                <!-- Modal Borrar Anime -->
                <div id="borrarAnimeModal<%= session.getAttribute("codigoAnime")%>" class="modal fade">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <form action="eliminar.jsp" mathod="post">
                        <div class="modal-header">						
                          <h4 class="modal-title">Borrar Anime</h4>
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                          <p>¿Seguro que quiere borrar el siguiente anime de la lista?</p>
                          <p><%= session.getAttribute("nombreAnime")%></p>
                          <input type="hidden" name="borrarAnime" value="<%= session.getAttribute("codigoAnime")%>">
                          <p class="text-warning"><small>Estos cambios no se podrán deshacer.</small></p>
                        </div>
                        <div class="modal-footer">
                          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                          <input type="submit" class="btn btn-danger" value="Borrar">
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                <!--Boton de Ver Detalles-->
                <a href="#verAnimeModal<%= session.getAttribute("codigoAnime")%>" class="view" data-toggle="modal"><i class="fa fa-eye" aria-hidden="true" data-toggle="tooltip" title="Detalles"></i></a>
                <!--Modal Ver Detalles Anime-->
                <div id="verAnimeModal<%= session.getAttribute("codigoAnime")%>" class="modal fade">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">						
                        <h4 class="modal-title">Detalles del Anime</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      </div>
                      <div class="modal-body">	
                        <h4>Nombre</h4>
                        <p><%= session.getAttribute("nombreAnime")%></p><br>
                        <h4>Tipo</h4>
                        <p><%= session.getAttribute("nombreTipo")%></p><br>
                        <h4>Generos</h4>
                        <p><%= session.getAttribute("generoAnime")%></p><br>
                        <h4>Sinopsis</h4>
                        <p><%= session.getAttribute("sinopsisAnime")%></p><br>
                        <h4>Numero de Episodios</h4>
                        <p><%= session.getAttribute("numeroEpisodiosAnime")%></p><br>
                        <h4>Duracion de los Episodios</h4>
                        <p><%= session.getAttribute("duracionEpisodioAnime")%> minutos</p><br>
                        <h4>Fecha de Estreno</h4>
                        <p><%= session.getAttribute("fechaEstrenoAnime")%></p><br>
                        <h4>Estudio de Animacion</h4>
                        <p><%= session.getAttribute("estudioAnimacionAnime")%></p><br>
                      </div>
                      <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Volver">
                      </div>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
            <%
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
          
    <!-- Modal Agregar Anime-->
    <div id="agregarAnimeModal" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <form action="agregar.jsp" method="post">
            <div class="modal-header">						
              <h4 class="modal-title">Agregar Anime</h4>
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">					
              <div class="form-group">
                <label>Nombre</label>
                <input type="text" name="nombre" class="form-control" required>
              </div>
              <div class="form-group">
                <label>Tipo</label>
                <select name="tipo" class="form-control" required>
                <%
                  ResultSet tipo2 = s3.executeQuery("SELECT * FROM TIPO");
                  while (tipo2.next()) {
                %>
                <option value="<%= tipo2.getString("CodTip")%>"><%= tipo2.getString("NomTip")%></option>
                <%
                  }
                %>
                </select>
              </div>
              <div class="form-group">
                <label>Generos</label>
                <input type="text" name="genero" class="form-control" required>
              </div>
              <div class="form-group">
                <label>Sinopsis</label>
                <textarea class="form-control" name="sinopsis" required></textarea>
              </div>
              <div class="form-group">
                <label>Numero de episodios</label>
                <input type="number" class="form-control" min="1" step="1" name="numeroEpisodios" required>
              </div>
              <div class="form-group">
                <label>Duracion de los episodios (en minutos)</label>
                <input type="number" class="form-control" name="duracionEpisodios" min="0" step="1" required>
              </div>
              <div class="form-group">
                <label>Fecha de estreno</label>
                <input type="date" class="form-control" name="fechaEstreno" required>
              </div>
              <div class="form-group">
                <label>Estudio</label>
                <input type="text" name="estudio" class="form-control" required>
              </div>
            </div>
            <div class="modal-footer">
              <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
              <input type="reset" class="btn btn-warning" value="Limpiar">
              <input type="submit" class="btn btn-success" value="Agregar">
            </div>
          </form>
        </div>
      </div>
    </div>
    <%
      conexion.close();
    %>
  </body>
</html>
