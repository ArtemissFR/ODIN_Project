<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WEB ODIN</title>
    <style>
        @font-face {
            font-family: 'Lexend';
            src: url('../fonts/Lexend.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'Lexend', sans-serif;
            background-color: #333;
            color: #ffffff;
            text-align: center;
        }
        h1 {
            color: #ffae00;
            font-family: fantasy;
            background-color: #5a5a5a;
            border-radius: 20px;
            margin-left: 100px;
            margin-right: 100px;
        }
        p {
            font-size: 18px;
            font-family: 'Lexend', sans-serif;
        }

        .mainclass {
            background-color: #5a5a5a;
            align-content: center;
            border-radius: 60px;
            height: auto;
            margin-left: 150px;
            margin-right: 150px;
            margin-bottom: 20px;
        }

        .mainclass div {
            margin: 35px;
            background-color: #ffffff;
            border-radius: 30px;
            text-align: center;
            transition: all 0.9s;
            margin-left: 300px;
            margin-right: 300px;
        }

        .mainclass div:hover {
            margin: 35px;
            background-color: #93c4ff;
            border-radius: 30px;
            text-align: center;
            transition: all 0.9s;
            margin-left: 150px;
            margin-right: 150px;
        }

        .mainclass div a {
            text-align: center;
            color: #ffae00;
            text-decoration: none;
            font-size: larger;
            font-weight: bold;
            font-family: 'Lexend', sans-serif;
            transition: all 0.3s;
        }

        .mainclass div:hover a {
            text-align: center;
            color: #000000;
        }
    </style>
</head>
<body>
    <header>
        <h1>ODIN</h1>
        <p>This is the Web version of ODIN (still working on it...)</p>
    </header>

    <section class="mainclass">
        <div>
            <a href="Hello-My-Dir\Hello_My_Dir.ps1">Download Hello-My-Dir</a>
        </div>
        <div>
            <a href="Harden-AD\Harden-AD.ps1">Download Harden-AD</a>
        </div>
        <div>
            <a href="RansomLord\RansomLord_v3.1.ps1">Download RansomLord</a>
        </div>
        <div>
            <a href="PingCastle\PingCastle.ps1">Download PingCastle</a>
        </div>
        <div>
            <a href="PurpleKnight\PurpleKnight.ps1">Download PurpleKnight</a>
        </div>
        <div>
            <a href="ADACLScanner\ADACLScanner.ps1">Download AD ACL Scanner</a>
        </div>
    </section>

    <section class="mainclass">
        <div>
            <a href="#">Next step ...</a>
        </div>
    </section>
</body>
</html>
