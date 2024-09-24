% Fakta-fakta gejala dan penyakit

% Hawar Daun Bakteri
gejala(hawar_daun_bakteri, daun_menguning).
gejala(hawar_daun_bakteri, garis_coklat).
gejala(hawar_daun_bakteri, daun_mengering).
gejala(hawar_daun_bakteri, cairan_bakteri).

% busuk batang
gejala(busuk_batang, batang_membusuk).
gejala(busuk_batang, batang_mudah_patah).
gejala(busuk_batang, malai_kecil).
gejala(busuk_batang, lesi_menghitam).

% Tungro
gejala(tungro, daun_menguning).
gejala(tungro, daun_pendek).
gejala(tungro, anakan_sedikit).
gejala(tungro, malai_kecil).

% Blast
gejala(blast, daun_mengering).
gejala(blast, bercak_coklat).
gejala(blast, bulir_hampa).
gejala(blast, batang_membusuk).

% Kerdil rumput
gejala(kerdil_rumput, tanaman_kerdil).
gejala(kerdil_rumput, daun_pendek).
gejala(kerdil_rumput, bercak_coklat).
gejala(kerdil_rumput, anakan_berlebih).

% Aturan untuk mencocokkan penyakit berdasarkan gejala
penyakit(Penyakit, Gejala) :- 
    gejala(Penyakit, Gejala).

% Predikat utama untuk mencetak hasil diagnosa penyakit
diagnosa :-
    write('Masukkan gejala-gejala yang Anda temukan pada tanaman padi (akhiri dengan titik):'), nl,
    baca_gejala(GejalaList), % Membaca input gejala dari user
    cari_penyakit(GejalaList, PenyakitList), % Mencari penyakit berdasarkan gejala
    tampilkan_hasil(PenyakitList).

% Membaca gejala dari user
baca_gejala([G|T]) :-
    write('Gejala: '), read(G),
    G \= selesai, % Kondisi untuk mengakhiri input dengan 'selesai'
    baca_gejala(T).
baca_gejala([]).

% Mencari penyakit berdasarkan gejala yang diinput
cari_penyakit([], []).
cari_penyakit([Gejala|T], PenyakitList) :-
    findall(Penyakit, penyakit(Penyakit, Gejala), PenyakitBerdasarkanGejala),
    cari_penyakit(T, PenyakitLain),
    append(PenyakitBerdasarkanGejala, PenyakitLain, PenyakitListSementara),
    sort(PenyakitListSementara, PenyakitList).

% Menampilkan hasil diagnosis
tampilkan_hasil([]) :-
    write('Tidak ada penyakit yang cocok dengan gejala yang diberikan.'), nl.
tampilkan_hasil(PenyakitList) :-
    write('Kemungkinan penyakit berdasarkan gejala yang Anda masukkan adalah: '), nl,
    tampilkan_penyakit(PenyakitList).

% Menampilkan daftar penyakit yang ditemukan
tampilkan_penyakit([]).
tampilkan_penyakit([Penyakit|T]) :-
    write('- '), write(Penyakit), nl,
    tampilkan_penyakit(T).