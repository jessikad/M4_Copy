﻿<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Master/SKD.Master" AutoEventWireup="true" CodeBehind="M16_ConsultarMensualidad.aspx.cs" Inherits="templateApp.GUI.Modulo16.M16_ConsultarMensualidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="breads" runat="server">
    <div>
	    <ol class="breadcrumb" style="background-color:rgba(0,0,0,0);">
		    <li>
			    <a href="../Master/Inicio.aspx">Inicio</a>
		    </li>
		
		    <li>
			    <a href="../Modulo16/M16_VerCarrito.aspx">Ver Carrito</a> 
		    </li>

            <li>
			    <a href="#">Consultar Mensualidad</a> 
		    </li>
		</ol>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server"> Consulta de Mensualidades
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="subtitulo" runat="server"> Mensualidades en Existencia:
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contenidoCentral" runat="server">

    <div class="alert alert-success alert-dismissable" style="display:none" id="prueba">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"  >&times;</button>
            La Mensualidad se ha Agregado Exitosamente al Carrito.
        </div>

     <div class="box-body table-responsive">

         <!--MODAL PARA EL DETALLE-->
     <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Mensualidad(es) Morosa(s)</h3>
                </div><!-- /.box-header -->

       <table id="example" class="table table-bordered table-striped dataTable">
        <thead>
            <tr>
                <th>Mes</th>
                <th>Anio</th>
                <th>Monto (Bs.)</th>
                <th>Fecha tope para cancelar</th>
                
                
            </tr>
        </thead>
 
        <tfoot>
            <tr>
               <th>Mes</th>
                <th>Anio</th>
                <th>Monto (Bs.)</th>
                <th>Fecha tope para cancelar</th>
                
            </tr>
        </tfoot>
 
        <tbody>
            <tr>
               <td>Marzo</td>
                <td>2015</td>
                <td>190.000</td>
                <td>1 de Abril de 2015</td>
                <td><a class="btn btn-primary glyphicon glyphicon-info-sign" data-toggle="modal" data-target="#modal-info1" href="#"></a></td>
            </tr>
             <tr>
                <td>Abril</td>
                <td>2015</td>
                <td>200.000</td>
                <td>1 de Mayo de 2015</td>
                <td><a class="btn btn-primary glyphicon glyphicon-info-sign" data-toggle="modal" data-target="#modal-info1" href="#"></a></td>
            </tr>
            

        </tbody>
    </table>

                  <!--MODAL PARA EL DETALLE -->
<div id="modal-info1" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h2 class="modal-title">Información detallada de la Mensualidad</h2>
					</div>
					<div class="modal-body">
						<div class="container-fluid" id="info1">
							<div class="row">
                                 
								<h3>Mes</h3>
									Marzo 
                                <br />
                                <h3>Anio</h3>
									2015
                                <br />
                                <h3>Monto (Bs.)</h3>
                                    190.000
                                <br />
                                <h3>Fecha tope para cancelar</h3>
                                    1 de Abril de 2015
                                <br />
								<h3>Dojo Asociado</h3>
                                    Kyu-dan
                                <br />
                                <h3>Especialidad del Curso</h3>
                                    Cinta Blanca
                                <br />
                                
                                <form role="form" class="form-horizontal" method="POST">
								    <h3>Descricion</h3>
								    <p>
									    Mensualidad pendiente por pagar en el mes de Marzo. Tiene la oportunidad de pagar hasta
                                        el 1 de Abril, sin recargo adicional. Por favor cancele la deuda que tiene pendiente.
								    </p>
								    <div class="form-group">
		                                <div class="box-footer">
				                            <button id="Boton1" style="align-content:flex-end" runat="server"  class="btn btn-primary" type="button"  onclick="$('#modal-info1').modal('hide'); $('#prueba').show(); " >Agregar al Carrito</button>
                                            
			                            </div>
	                                </div>
                                </form>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

    </div>

     <!--VALIDACION PARA MODAL -->
             <script type="text/javascript">
             $(document).ready(function () {

                 var table = $('#example').DataTable({
                     "language": {
                         "url": "http://cdn.datatables.net/plug-ins/1.10.9/i18n/Spanish.json"
                     }
                 });
                 var req;
                 var tr;

                 $('#example tbody').on('click', 'a', function () {
                     if ($(this).parent().hasClass('selected')) {
                         req = $(this).parent().prev().prev().prev().text();
                         tr = $(this).parents('tr');//se guarda la fila seleccionada
                         $(this).parent().removeClass('selected');

                     }
                     else {
                         req = $(this).parent().prev().prev().prev().text();
                         tr = $(this).parents('tr');//se guarda la fila seleccionada
                         table.$('tr.selected').removeClass('selected');
                         $(this).parent().addClass('selected');
                     }

                 });

                 $('#modal-delete').on('show.bs.modal', function (event) {
                     var modal = $(this)
                     modal.find('.modal-title').text('Eliminar requerimiento:  ' + req)
                     modal.find('#req').text(req)
                 })
                 $('#btn-eliminar').on('click', function () {
                     table.row(tr).remove().draw();//se elimina la fila de la tabla
                     $('#modal-delete').modal('hide');//se esconde el modal
                     $('#prueba').show();//Muestra el mensaje de agregado exitosamente

                 });
             });
        </script>

</asp:Content>