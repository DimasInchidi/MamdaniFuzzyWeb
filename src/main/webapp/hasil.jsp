<%@ page import="servlet.F_Koneksi" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    String id =request.getParameter("mamimu");
//    if (id ==null || id.equalsIgnoreCase("")) {
//        response.sendRedirect("/");
//    }else{
//    F_Koneksi Koneksi = new F_Koneksi();
//    Object[][] Hasil = Koneksi.Select("SELECT * FROM clientdata WHERE id = '"+id+"';",7);
//    System.out.println(Arrays.toString(Hasil));
    Object[][] Hasil = {{"938350345","aku","aku","aku","aku","Dimas Ari","87"}};
    if  (Hasil == null){response.sendRedirect("/");}else{
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Who Looks Like Bu Novi - Hasil</title>
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- Bootstrap Core CSS -->
    <link href="./bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="./dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="./bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="">Who Looks Like Bu Novi - With Fuzzy Logic</a>
            </div>

            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <%--<jsp:include page="./pages/result.jsp" flush="true"/>--%>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Hasil</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">

                <div class="col-lg-12 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-1">
                                    <i class="fa fa-star fa-5x"></i>
                                </div>
                                <div class="col-xs-5">
                                    <div> </div>
                                    <div class="huge"><%=Hasil[0][5]%></div>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <div class="huge"><%=Hasil[0][6]%></div>
                                    <%
                                        if (Float.parseFloat(Hasil[0][6].toString()) < 33f){
                                    %>
                                    <div>Anda tidak mirip Bu Novi</div>
                                    <%
                                    }else if (Float.parseFloat(Hasil[0][6].toString()) < 66f){
                                    %>
                                    <div>Anda sedikit mirip Bu Novi!</div>
                                    <%
                                        }else{
                                    %>
                                    <div>Anda mirip Bu Novi!!</div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-6">
                    <div class="panel panel-body">
                        <%--TODO: Penjelasan cara perhitungan--%>
                        <p>Untuk menentukan pemenang dari kontes "Who Looks Like Bu Novi" kami memerlukan nilai kemiripan kontestan dengan Ibu Novi. Untuk memperkecil ruang lingkup perhitungan kami memutuskan bahwa orang yang memiliki kemungkinan mirip dengan Ibu Novi adalah orang yang memiliki usia di atas 13 tahun hingga 35 tahun. Dari data yang dapat kami kumpulkan, ukuran sepatu untuk pria dan wanita paling kecil yang digunakan oleh orang usia di atas 15 tahun adalah ukuran 35, dan ukuran sepatu paling besar adalah 43. Tinggi badan berada pada kisaran 160-180. Kemudian kami membagi warna kulit menjadi 5 jenis yaitu, hitam, coklat, sawo matang, kuning langsat, putih.<br>
                            Agar mudah dipahami dan dapat menjadi sebuah penilaian yang baik kami membatasi nilai kemiripan dari 0 sampai 100.<br>
                            Kemudian dari data Anda, Jenis Kelamin anu, Nomor Sepatu anu, Warna Kulit anu, dan Tinggi Badan anu kami menggunakan 8 aturan fuzzy sebagai berikut:</p>
                            <br>
                            <p class="text-center">
                            [R1] IF jeniskelamin SAMA AND nomorsepatu SAMA THEN NilaiKemiripan BERTAMBAH.<br>
                            [R2] IF warnakulit SAMA AND tinggibadan SAMA THEN NilaiKemiripan BERTAMBAH.<br>
                            [R3] IF jeniskelamin BEDA AND nomorsepatu BEDA THEN NilaiKemiripan BERKURANG.<br>
                            [R4] IF warnakulit BEDA AND tinggibadan BEDA THEN NilaiKemiripan BERKURANG.<br>
                            [R5] IF jeniskelamin SAMA AND nomorsepatu BEDA THEN NilaiKemiripan BERTAMBAH.<br>
                            [R6] IF warnakulit SAMA AND tinggibadan BEDA THEN NilaiKemiripan BERTAMBAH.<br>
                            [R7] IF jeniskelamin BEDA AND nomorsepatu SAMA THEN NilaiKemiripan BERKURANG.<br>
                            [R8] IF warnakulit BEDA AND tinggibadan SAMA THEN NilaiKemiripan BERKURANG.<br>
                            </p>
                            <br>
                            <p>Ada 4 variabel fuzzy yang dimodelkan, yaitu: jeniskelamin, nomorsepatu, warnakulit, dan tinggibadan. Semua variable fuzzy yang dimodelkan terdiri atas 2 himpunan fuzzy SAMA dan BEDA.</p><br>
                            <div class="col-lg-6 text-center"><img style="width: 470px; height: 200px" src="img/jk.png">Jenis Kelamin</div>
                            <div class="col-lg-6 text-center"><img style="width: 470px; height: 200px" src="img/ns.png">Nomor Sepatu</div>
                            <div class="col-lg-6 text-center"><img style="width: 470px; height: 200px" src="img/wk.png">Warna Kulit</div>
                            <div class="col-lg-6 text-center"><img style="width: 470px; height: 200px" src="img/tb.png">Tinggi Badan</div><br>
                            <br>
                            <p>Mencari Nilai Keanggotaan:<br>
                            µjeniskelaminSAMA = <br>
                            µjeniskelaminBEDA = 1 - µjeniskelaminSAMA = <br>
                            µnomorsepatuSAMA = <br>
                            µnomorsepatuBEDA = 1 - µnomorsepatuSAMA = <br>
                            µwarnakulitSAMA = <br>
                            µwarnakulitBEDA = 1 - µwarnakulitSAMA = <br>
                            µtinggibadanSAMA = <br>
                            µtinggibadanBEDA = 1 - µtinggibadanSAMA =
                            </p>
                                <br>
                            <p>
                                Mencari nilai z untuk setiap aturan:<br>
                            α-predikat1<br>
                            α-predikat2<br>
                            α-predikat3<br>
                            α-predikat4<br>
                            α-predikat5<br>
                            α-predikat6<br>
                            α-predikat7<br>
                            α-predikat8</p>
                            <br>
                            Nilai Z akhir:<br>
                            <div class="col-lg-1 text-center">z=</div>
                            <div class="col-lg-11">
                                1 + 1<br>
                                <div class="fa-border"></div>
                                1+1<br>
                            </div>
                            z=<br>
                            z=<br>
                    </div>
                </div>
            </div>

            <hr>

            <div class="text-center">
                Mampir ke github kami yaak!
                <a class="btn btn-social-icon btn-github" href="https://github.com/DimasInchidi/FuzzyBuNovi"><i class="fa fa-github"></i></a>
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="bower_components/raphael/raphael-min.js"></script>
    <script src="bower_components/morrisjs/morris.min.js"></script>
    <script src="js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>
<%
    }
//    }
%>