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
                                                try{
                                                Object[][] hasil = FK.Select("SELECT * FROM clientdata Group by `clientdata`.`nama` ORDER BY `clientdata`.`nilaikemiripan`  DESC", 10);
                                                    for (Object[] Hasil : hasil) {
                                                        out.print("<tr>");
                                                        out.print("<td>");
                                                        out.print("<a class=\"btn btn-social-icon btn-facebook\" href=\"https://facebook.com/" + Hasil[0] + "\"><i class=\"fa fa-facebook\"></i></a>");
                                                        out.print(" <a href=\"https://facebook.com/" + Hasil[0] + "\">" + Hasil[5]);
                                                        out.print("</a></td>");
                                                        out.print("<td>");
                                                        out.print(Hasil[6]);
                                                        out.print("</td>");
                                                        out.print("</tr>");
                                                    }
                                                }catch(Exception ex){
                                                    out.print("Data Kosong");
                                                }
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

