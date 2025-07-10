<?php
include 'function.php';
if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 0) {
        header("location: indexAdmin.php");
    } else if ($_SESSION['role'] == 2) {
        header("location: indexPakar.php");
    }
}

if (!isset($_SESSION['persentase'])) {
    $_SESSION['persentase'] = [];
}


$gejala = mysqli_query($koneksi, "SELECT * FROM gejala");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <link rel="stylesheet" href="style.css">
    <style>
    .fullSection {
        height: 100vh !important;
        display: flex;
        flex-direction: column;
    }
    </style>
    <title>Kulit Wajah</title>
</head>

<body class="align-items-center border flex-sm-column">
    <div class="main-content w-100 fullSection">
        <nav class="navbar py-2 navbar-expand-lg navbar-light">
            <div class="container">
                <h3>Kulit Wajah</h3> <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li>
                            <a class="btn px-4 btn-primary ml-2" href="logout.php" role="button">Log Out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="mt-5 my-auto">
            <div class="container">
                <div class="row">
                    <div class="col align-self-center ">
                        <h2 class="mb-4">Pertanyaan : </h2>
                        <form action="" method="post" enctype="multipart/form-data" role="form">
                            <?php
                            $id_penyakit = 1;
                            // if(!isset($_SESSION['id_penyakit'])){
                            //     $_SESSION['id_penyakit'] = $id_penyakit;
                            // }else{
                            //     $id_penyakit = $_SESSION['id_penyakit'];
                            // }
                            $id = gejala($id_penyakit);
                            $id_gejala = intval($id);
                            if (!isset($_SESSION['id_gejala'])) {
                                $_SESSION['id_gejala'] = $id_gejala;
                            } else {
                                $id_gejala = $_SESSION['id_gejala'];
                            }
                            $data = mysqli_query($koneksi, "SELECT gejala FROM gejala WHERE id_gejala = '$id_gejala'");
                            // var_dump($data);
                            $row = mysqli_fetch_assoc($data);
                            ?>
                            <p class="mb-4">
                            <h6>Apakah kulit anda <?= $row['gejala']; ?> ?</h6>
                            </p>
                            <?php
                            echo '<input type="submit" class="btn btn-success  mr-2 px-4 py-2" name="ya" value="Ya">';
                            echo '<input type="submit" class="btn btn-danger px-3 py-2" name="tidak" value="Tidak">';
                            $persentase = $_SESSION['persentase'];
                            $temp = 0;
                            $_SESSION['id_gejala'] = $id_gejala;
                            $next_gejala = $_SESSION['id_gejala'];
                            // $next_penyakit = $_SESSION['id_penyakit'];
                            if (isset($_POST['ya'])) {
                                if (isset($id_gejala)) {
                                    $temp = $id_gejala;
                                    array_push($persentase, $temp);
                                }
                                $_SESSION['persentase'] = $persentase;
                                $next_gejala = $id_gejala + 1;
                                $_SESSION['id_gejala'] = $next_gejala;
                            } else if (isset($_POST['tidak'])) {
                                $next_gejala = $id_gejala + 1;
                                $_SESSION['id_gejala'] = $next_gejala;
                                // $next_penyakit = $id_penyakit += 1;
                                // $_SESSION['id_penyakit'] = $next_penyakit;
                            }

                            if ($_SESSION['id_gejala'] > 33) {

                                $normal = array(8, 17, 26, 29);
                                $kering = array(3, 4, 9, 21, 23, 34, 27, 30);
                                $berminyak = array(1, 2, 3, 5, 6, 7, 10, 12, 15, 20, 22, 28, 31, 32);
                                $kombinasi = array(2, 6, 11, 16, 18, 19, 22, 24, 25, 27, 28, 30, 33);


                                $nilai = 0;
                                foreach ($persentase as $value) {
                                    if (in_array($value, $normal)) {
                                        $nilai += 1;
                                    } else {
                                        $nilai += 0;
                                    }
                                }
                                $KulitNormal = $nilai / count($normal);
                                $kulitnormal = number_format($KulitNormal, 3);
                                $HasilKulitNormal = $kulitnormal * 100;

                                $_SESSION['normal'] = $HasilKulitNormal;


                                $nilai = 0;
                                foreach ($persentase as $value) {
                                    if (in_array($value, $kering)) {
                                        $nilai += 1;
                                    } else {
                                        $nilai += 0;
                                    }
                                }
                                $KulitKering = $nilai / count($kering);
                                $kulitkering = number_format($KulitKering, 3);
                                $HasilKulitKering = $kulitkering * 100;

                                $_SESSION['kering'] = $HasilKulitKering;


                                $nilai = 0;
                                foreach ($persentase as $value) {
                                    if (in_array($value, $berminyak)) {
                                        $nilai += 1;
                                    } else {
                                        $nilai += 0;
                                    }
                                }
                                $KulitBerminyak = $nilai / count($berminyak);
                                $kulitberminyak = number_format($KulitBerminyak, 3);
                                $HasilKulitBerminyak = $kulitberminyak * 100;

                                $_SESSION['berminyak'] = $HasilKulitBerminyak;


                                $nilai = 0;
                                foreach ($persentase as $value) {
                                    if (in_array($value, $kombinasi)) {
                                        $nilai += 1;
                                    } else {
                                        $nilai += 0;
                                    }
                                }
                                $KulitKombinasi = $nilai / count($kombinasi);
                                $kulitkombinasi = number_format($KulitKombinasi, 3);
                                $HasilKulitKombinasi = $kulitkombinasi * 100;

                                $_SESSION['kombinasi'] = $HasilKulitKombinasi;


                                header('Location:hasil.php');
                            }
                            ?>
                            <br>
                    </div>
                    </form>
                    <div class="col d-none d-sm-block">
                        <img width="500" src="gambar/pict.jpeg" alt="hero" />
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
</script>

</html>