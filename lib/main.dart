import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Course Scheduling",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Daftar Jadwal Per Hari",
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          //
          //==========Stack untuk daftar hari dan jumlah matkul========================
          //menggunakan positioned untuk 4 container yang tidak berada di tengah
          //2 container kanan pakai margin yang berdasarkan lebar layar, sehingga
          //akan mengikuti layar ketika dilebarkan
          //untuk container ditengah menggunakan align dan langsung dipin ke tengah
          //layar agar container selalu berada ditengah
          //ini pake clipBehavior supaya gak balapan ama part body yang lain,
          //jadi dia langsung potong itu nya yang itu XD, bahasaku remed
          //untuk image disimpan dalam folder imej, dan ada kendala ketika ingin load
          //IDM(Internet Download Manager) ke trigger untuk download asset.bin nya
          //jadi IDM nya diatur agar jangan download di localhost
          //===========================================================================
          //
          Stack(
            clipBehavior: Clip.none,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned(
                top: 15,
                left: MediaQuery.of(context).size.width - 105,
                child: Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 18, 201),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Column(
                      children: [
                        Text(
                          "JUM'AT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ),
              Positioned(
                top: 15,
                left: MediaQuery.of(context).size.width - 190,
                child: Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 18, 201),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Column(
                      children: [
                        Text(
                          "KAMIS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ),
              Positioned(
                top: 15,
                left: 90,
                child: Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 18, 201),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Column(
                      children: [
                        Text(
                          "SELASA",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "4",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ),
              Positioned(
                top: 15,
                left: 5,
                child: Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 18, 201),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Column(
                      children: [
                        Text(
                          "SENIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "1",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    width: 100,
                    height: 150,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 18, 201),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                        image: DecorationImage(
                            image: AssetImage("imej/buku.jpg"))),
                    child: Column(
                      children: [
                        Text(
                          "RABU",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),

          //===============DAFTAR MATKUL MENGGUNAKAN LISTVIEW================
          //container dibungkus dalam Expanded karena kalo pake Column gak mau
          //muncul doi, jadi harus dibungkus pake Expanded dan dikasih anak >.<
          //anaknya berupa ListView dan beranak banyak container, setiap
          //container sama semua cirinya, dari lebar, margin , sampe jumlah
          //baris. Hanya tulisan yang beda. Text nya dikasih rata kiri pake
          //fungsi crossAxisAlignment, karena kalo pake textAlign dia balapan
          //sama text lainnya, jadi kalo ada text yang gede, text kecilnya
          //mengalah dan jadi bikin gap yang memicu OCD
          //=================================================================

          Expanded(
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Senin, 09:10-10:40",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "2109106073",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Anton Prafanto, MT",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selasa, 07:30-9:00",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Nur Yahya",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Frederik Allotodang, M.Kom",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selasa, 07:30-9:00",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Jaringan Komputer Lanjut",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Dedy Cahyadi, M.Eng",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selasa, 09:10-10:40",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Teori Bahasa dan Otomata",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Prof. Dr. Anindita Septiarini, M.Cs",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selasa, 10:50-12:20",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Pengantar Teknologi Informasi",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Zainal Arifin, M.Kom",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rabu, 09:10-10:40",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Kecerdasan Buatan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Prof. Dr. Anindita Septiarini, M.Cs",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rabu, 10:50-12:20",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Pemrograman Piranti Bergerak",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Anton Prafanto, MT",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rabu, 13:00-14:30",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Etika Profesi IT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Ir. Novianti Puspitasari, M.Eng",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kamis, 13:00-14:30",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Grafika Komputer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Awang Harsa K, M.Kom",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kalkulus, 14:40-16:10",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Kalkulus",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Wasono, S.Si.,M.Si",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
