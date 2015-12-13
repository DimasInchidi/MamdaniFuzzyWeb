<%@ page contentType="text/html;charset=UTF-8" language="java" import="servlet.F_Koneksi" %>
<%@ page import="java.sql.ResultSet" %>
<!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Hasil Kontes
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nama</th>
                                            <th>Nilai</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                            <%
                                                response.setIntHeader("Refresh", 5);
                                                F_Koneksi FK = new F_Koneksi();
//                                                try{
//                                                ResultSet rs = FK.Select("`dataPartisipan`.`NickName`,`dataScore`.`Nama`,`dataScore`.`Score`", "`dataScore`,`dataPartisipan`", "WHERE `dataPartisipan`.`Nama`=`dataScore`.`Nama` Group by `dataPartisipan`.`Nama` ORDER BY `dataScore`.`Score`  DESC");
//                                                rs.next();
//                                                while(!rs.isAfterLast()){
//                                                    out.print("<tr>");
//                                                    out.print("<td>");
//                                                    out.print("<a class=\"btn btn-social-icon btn-facebook\" href=\"https://facebook.com/"+rs.getString(1)+"\"><i class=\"fa fa-facebook\"></i></a>");
//                                                    out.print(" <a href=\"https://facebook.com/"+rs.getString(1)+"\">"+rs.getString(2));
//                                                    out.print("</a></td>");
//                                                    out.print("<td>");
//                                                    out.print(rs.getDouble(3));
//                                                    out.print("</td>");
//                                                    out.print("</tr>");
//                                                    rs.next();
//                                                }
//                                                }catch(Exception ex){
//                                                    ex.printStackTrace();
//                                                }
                                            %>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

