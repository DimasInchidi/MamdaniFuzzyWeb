<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="servlet.FBConnection" %>
<%@ page import="servlet.FBGraph" %>
<%@ page import="java.util.Map" %>
<%@ page import="servlet.F_Koneksi" %>
<%
    System.out.println("pageHead");
    String code="",url="", accessToken="", graph="";
    Map fbProfileData = null;
        code = request.getParameter("code");
    if (code == null || code.equals("")) {
        FBConnection fbConnection = new FBConnection();
        url = fbConnection.getFBAuthUrl();
        response.sendRedirect(url);
    } else{
        FBConnection fbConnection = new FBConnection();
        accessToken = fbConnection.getAccessToken(code);

        FBGraph fbGraph = new FBGraph(accessToken);
        graph = fbGraph.getFBGraph();
        fbProfileData = fbGraph.getGraphData(graph);
        String id = fbProfileData.get("id").toString();
        System.out.println("IDnye "+id);
        F_Koneksi Koneksi = new F_Koneksi();
        String query = "SELECT * FROM clientdata WHERE id = '"+id+"';";
        if (Koneksi.SelectCheck(query)){
            response.sendRedirect("/hasil?mamimu="+id);
        }else{
            String fail;
            if (session.getAttribute("fail") == null || session.getAttribute("fail").equals("")){
                fail = "none";
            } else{
                fail = session.getAttribute("fail").toString();
            }
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Who Looks Like Bu Novi - Form</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                        <jsp:include page="./pages/result.jsp" flush="true"/>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" align="center">Good Luck!</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 -align-center">
                    <img class="col-lg-12" src="http://graph.facebook.com/<%=fbProfileData.get("id")%>/picture?type=large">
                </div>
                <div class="col-lg-9">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Masukan Data Anda
                        </div>
                        <div class="panel-body">

                            <form role="form" action="FIS" method="post">
                                <fieldset disabled>
                                    <div class="form-group">
                                        <label>Nama</label>
                                        <input class="form-control" id="disabledInput" type="text" placeholder="<%=fbProfileData.get("name")%>" disabled>
                                    </div>
                                </fieldset>

                                <div class="form-group">
                                    <label>Jenis Kelamin</label>
                                    <select class="form-control" name="jeniskelamin">
                                        <option>Laki-laki</option>
                                        <option>Perempuan</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Tinggi Badan</label>
                                    <input class="form-control" name="tinggibadan">
                                    <p class="help-block">tinggi badan anda dalam satuan CM</p>
                                </div>

                                <div class="form-group">
                                    <label>Warna Kulit</label>
                                    <select class="form-control" name="warnakulit">
                                        <option>Hitam</option>
                                        <option>Coklat</option>
                                        <option>Sawo Matang</option>
                                        <option>Kuning Langsat</option>
                                        <option>Putih</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Nomor Sepatu</label>
                                    <input class="form-control" name="nomorsepatu">
                                    <p class="help-block">Lihat di <a href="http://www.itsmachmudi.files.wordpress.com/2014/02/tabel-ukuran-sepatu.png">tabel ini</a></p>
                                </div>

                                <div class="form-group">
                                    <label>Berat Badan</label>
                                    <input class="form-control" name="beratbadan">
                                    <p class="help-block">berat badan anda dalam satuan kg</p>
                                </div>

                                <div class="form-group">
                                    <label>Umur</label>
                                    <input class="form-control" name="umur" placeholder="<%=fbProfileData.get("age_range")%>">
                                    <p class="help-block">usia anda saat ini</p>
                                </div>

                                <div class="form-group">
                                    <label>Hobi</label>
                                    <input class="form-control" name="hobi">
                                    <p class="help-block">hal-hal menarik yang biasa anda lakukan</p>
                                </div>
                                <div class="form-group">
                                    <input class="hidden" name="id" value="<%=fbProfileData.get("id")%>">
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
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

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>

<!--
<div class="row">
<div class="col-lg-6">
<form role="form">
<div class="form-group">
<label>Text Input</label>
<input class="form-control">
<p class="help-block">Example block-level help text here.</p>
</div>
<div class="form-group">
<label>Text Input with Placeholder</label>
<input class="form-control" placeholder="Enter text">
</div>
<div class="form-group">
<label>Static Control</label>
<p class="form-control-static">email@example.com</p>
</div>
<div class="form-group">
<label>File input</label>
<input type="file">
</div>
<div class="form-group">
<label>Text area</label>
<textarea class="form-control" rows="3"></textarea>
</div>
<div class="form-group">
<label>Checkboxes</label>
<div class="checkbox">
<label>
<input type="checkbox" value="">Checkbox 1
</label>
</div>
<div class="checkbox">
<label>
<input type="checkbox" value="">Checkbox 2
</label>
</div>
<div class="checkbox">
<label>
<input type="checkbox" value="">Checkbox 3
</label>
</div>
</div>
<div class="form-group">
<label>Inline Checkboxes</label>
<label class="checkbox-inline">
<input type="checkbox">1
</label>
<label class="checkbox-inline">
<input type="checkbox">2
</label>
<label class="checkbox-inline">
<input type="checkbox">3
</label>
</div>
<div class="form-group">
<label>Radio Buttons</label>
<div class="radio">
<label>
<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Radio 1
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Radio 2
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Radio 3
</label>
</div>
</div>
<div class="form-group">
<label>Inline Radio Buttons</label>
<label class="radio-inline">
<input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked>1
</label>
<label class="radio-inline">
<input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
</label>
<label class="radio-inline">
<input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
</label>
</div>
<div class="form-group">
<label>Selects</label>
<select class="form-control">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
</select>
</div>
<div class="form-group">
<label>Multiple Selects</label>
<select multiple class="form-control">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
</select>
</div>
<button type="submit" class="btn btn-default">Submit Button</button>
<button type="reset" class="btn btn-default">Reset Button</button>
</form>
</div>
<!-- /.col-lg-6 (nested)
<div class="col-lg-6">
<h1>Disabled Form States</h1>
<form role="form">
<fieldset disabled>
<div class="form-group">
<label for="disabledSelect">Disabled input</label>
<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled>
</div>
<div class="form-group">
<label for="disabledSelect">Disabled select menu</label>
<select id="disabledSelect" class="form-control">
<option>Disabled select</option>
</select>
</div>
<div class="checkbox">
<label>
<input type="checkbox">Disabled Checkbox
</label>
</div>
<button type="submit" class="btn btn-primary">Disabled Button</button>
</fieldset>
</form>
<h1>Form Validation States</h1>
<form role="form">
<div class="form-group has-success">
<label class="control-label" for="inputSuccess">Input with success</label>
<input type="text" class="form-control" id="inputSuccess">
</div>
<div class="form-group has-warning">
<label class="control-label" for="inputWarning">Input with warning</label>
<input type="text" class="form-control" id="inputWarning">
</div>
<div class="form-group has-error">
<label class="control-label" for="inputError">Input with error</label>
<input type="text" class="form-control" id="inputError">
</div>
</form>
<h1>Input Groups</h1>
<form role="form">
<div class="form-group input-group">
<span class="input-group-addon">@</span>
<input type="text" class="form-control" placeholder="Username">
</div>
<div class="form-group input-group">
<input type="text" class="form-control">
<span class="input-group-addon">.00</span>
</div>
<div class="form-group input-group">
<span class="input-group-addon"><i class="fa fa-eur"></i>
</span>
<input type="text" class="form-control" placeholder="Font Awesome Icon">
</div>
<div class="form-group input-group">
<span class="input-group-addon">$</span>
<input type="text" class="form-control">
<span class="input-group-addon">.00</span>
</div>
<div class="form-group input-group">
<input type="text" class="form-control">
<span class="input-group-btn">
<button class="btn btn-default" type="button"><i class="fa fa-search"></i>
</button>
</span>
</div>
</form>
</div>
</div>
/.row (nested) -->
<%
    }
    }
%>