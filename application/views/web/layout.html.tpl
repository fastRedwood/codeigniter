<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7 lt-ie10"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8 lt-ie10"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9 lt-ie10"> <![endif]-->
<!--[if IE 9]>         <html class="no-js lt-ie10"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        
        <title>{{block name="title"}} 测试web layout {{/block}}</title> 
    
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="stylesheet" href="/resource/css/bootstrap.css">      
        <!-- adds CSS media query support to IE8   -->
        <!--[if lt IE 9]>
            <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.6.2/html5shiv.js"></script>
            <script src="./js/respond.min.js"></script>
        <![endif]-->
            {{block name="stylesheet"}}
                <link rel="stylesheet" href="/resource/web/css/base.css">
                <link rel="stylesheet" href="/resource/web/css/skeleton.css">
                <link rel="stylesheet" href="/resource/web/css/style.css" id="color">
                <link rel="stylesheet" href="/resource/web/css/icons.css">
            {{/block}}

        <!-- Common Scripts: -->
        <link rel="shortcut icon" href="http://nevidethemes.com/talia/images/favicon.ico">
        <!-- // <script src="./js/modernizr.js"></script> -->
       <!--  // <script src="./js/jquery.cookie.js"></script> -->
    </head>
<body class="scrollable">
        {{block name="header"}}
                    <!-- Preloader Animation -->
                    <div id="preloader">
                        <div class="animation"></div>
                    </div>

                    <!-- Responsive Menu Button -->
                    <a class="toggle-menu" id="mobile-menu" href="#sidr-main">
                        <i class="icon-reorder"></i>
                    </a>

                    <!-- Widescreen Menu -->
                    <header class="header sliding">
                        <div class="container">
                            <div class="sixteen columns">
                                <!-- Logo -->
                                <a class="header_logo scrollink" href="#home"><img src="/resource/web/images/slogo.png" alt=""></a>
                                <!-- Navigation -->
                                <nav>
                                    <ul>
                                        <li><a href="#home" class="scrollink">Home</a></li>

                                        <li><a href="#about" class="scrollink">About</a></li>

                                        <li><a href="#services" class="scrollink">Services</a></li>

                                        <li><a href="#portfolio" class="scrollink">Portfolio</a></li>

                                        <li><a href="#buynow" class="scrollink">Buy</a></li>

                                        <li><a href="#contact" class="scrollink">Contact</a></li>

                                        <li><a href="/user/login">Login</a></li>
                                    </ul>
                                </nav>  
                            </div>
                        </div>
                    </header>
        {{/block}}

        {{block name="content"}}
        {{/block}}

        <script src="/resource/uilibs/seajs/seajs/2.1.1/sea.js"></script>
        <script src="/resource/uilibs/seajs-config.js" language="javascript"></script>
        <script language="javascript">
            var __seajs_debug = 2;
            var __seajs_assets_version = '8';

            seajs.use('/resource/web/js/app.js', function(app){ 
                {{block page_script}}{{/block}}
            });

        </script>
    </body>
</html>