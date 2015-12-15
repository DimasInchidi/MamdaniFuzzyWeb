<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kontes Mirip Bu Novi</title>

    <!-- Bootstrap Core CSS -->
    <link href="./bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Social Buttons CSS -->
    <link href="./bower_components/bootstrap-social/bootstrap-social.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="./bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

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
            <a class="navbar-brand" href="#">Who Looks Like Bu Novi - With Fuzzy Logic</a>
        </div>

        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <jsp:include page="rank" flush="true"/>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" align="center">Who Looks Like Bu Novi Contest!</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Tentang kontes ini dan cara penilaian</h4>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                        Website ini didesikasikan untuk menyelesaikan tugas mata kuliah logika fuzzy yang diberikan oleh Ibu Novi pada tanggal 20 November 2015.
                        Di dalam website ini terdapat sistem inferensi fuzzy untuk menentukan nilai kemiripan seseorang dengan ibu novi menggunakan metode mamdani.
                        Ketika memulai kompetisi ini kami akan meminta ciri-ciri anda sebagai input penilaian kami.
                        Komposisi aturan dan cara penilaiannya akan muncul di halaman hasil agar anda tidak curang :)
                    <b>So, mulai ikuti kompetisi sekarang!</b>
                    <br>

                    <a class="btn btn-block btn-social btn-facebook" href="/FBConnect">
                        <i class="fa fa-facebook"></i>
                        <div align="center"> Sign in with Facebook</div>
                    </a>

                    <hr>

                    <div class="text-center">
                        Mampir ke github kami yaak!
                        <a class="btn btn-social-icon btn-github" href="https://github.com/DimasInchidi/FuzzyBuNovi"><i class="fa fa-github"></i></a>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="./bower_components/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="./bower_components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="./dist/js/sb-admin-2.js"></script>

</body>

</html>
