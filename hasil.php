<?php
include 'function.php';
if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 0) {
        header("location: indexAdmin.php");
    } else if ($_SESSION['role'] == 2) {
        header("location: indexPakar.php");
    }
} else {
    header("location:index.php");
}

$gejala = mysqli_query($koneksi, "SELECT * FROM gejala");
include 'includes/public/header.php';
?>

<body>
    <nav class="navbar py-2 navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <h2>Mendiagnosa Tipe Kulit Wajah</h2>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li>
                        <a class="btn px-2 py-2 btn-success ml-2" href="function.php?act=ulang" role="button">Cek
                            Ulang</a>
                    </li>
                    <li>
                        <a class="btn px-2 py-2 btn-primary ml-2" href="logout.php" role="button">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="hasil mt-4">
        <div class="container pb-5">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="mb-4">Diagnosa Tipe Kulit Berdasarkan Gejala : </h3>
                    <?php
                    $diseases = [
                        'Kulit Normal' => $_SESSION['normal'],
                        'Kulit Kering' => $_SESSION['kering'],
                        'Kulit Berminyak' => $_SESSION['berminyak'],
                        'Kulit Kombinasi' => $_SESSION['kombinasi'],
                    ];
                    ?>
                    <table class="table table-bordered ">
                        <tr>
                            <td class="align-middle font-weight-bold">Tipe-Tipe Kulit</td>
                            <td>
                                <?php
                                foreach ($diseases as $name => $percentage) {
                                    echo "<p>{$name} = <strong>{$percentage}%</strong> </p>";
                                }
                                ?>
                            </td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold">Tipe Kulit yang Anda Miliki</td>
                            <td> <?php
                                    // Cari penyakit dengan persentase tertinggi
                                    $penyakit_tertinggi = array_keys($diseases, max($diseases))[0];
                                    echo $penyakit_tertinggi;
                                    ?>

                        </tr>
                        <tr>
                            <td class="font-weight-bold">Persentase</td>
                            <td> <?php echo "<strong>$diseases[$penyakit_tertinggi]%</strong>" ?>
                        </tr>
                        <tr>
                            <td class="align-middle font-weight-bold">Ciri-Ciri yang Dialami</td>
                            <td> <?php foreach ($_SESSION['persentase'] as $id_gejala) {
                                        $query = "SELECT * FROM gejala WHERE id_gejala = '$id_gejala'";
                                        $data = mysqli_query($koneksi, $query);
                                        while ($row = mysqli_fetch_array($data)) {
                                            echo "<p>" . $row['gejala'] . "</p>";
                                        }
                                    } ?>
                        </tr>
                        <tr>
                            <td class="font-weight-bold">Deskripsi dan Saran Perawatan</td>
                            <td>
                                <form action="" method="post" enctype="multipart/form-data" role="form">
                                    <?php
                                    if (count($_SESSION['persentase']) > 0) {
                                        function maximum($a, $b, $c, $d)
                                        {
                                            $max = $a;
                                            $kode = 1;
                                            if ($b > $max) {
                                                $max = $b;
                                                $kode = 2;
                                            }
                                            if ($c > $max) {
                                                $max = $c;
                                                $kode = 3;
                                            }
                                            if ($d > $max) {
                                                $max = $d;
                                                $kode = 4;
                                            }
                                            return  $kode;
                                        }
                                        $id_penyakit = maximum($_SESSION['normal'], $_SESSION['kering'], $_SESSION['berminyak'], $_SESSION['kombinasi']);
                                        $query = "SELECT * FROM solusi WHERE id_penyakit = '$id_penyakit'";
                                        $data = mysqli_query($koneksi, $query);
                                        while ($row = mysqli_fetch_array($data)) {
                                            echo '<p><strong>Deskripsi :</strong> ' . $row['deskripsi'] . '</p>';
                                            echo '<p><strong>Solusi :</strong>' . $row['solusi'] . '</p>';
                                        }
                                    } else {
                                        echo '<p>Tidak ada gejala yang dipilih, jadi tidak ada hasil.</p>';
                                    }
                                    ?>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
    </section>
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