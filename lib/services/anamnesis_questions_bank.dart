// Medical Anamnesis Questions Bank
// Ported from TypeScript version in BPJS web app

class AnamnesisQuestion {
  final int questionNumber;
  final String question;
  final List<String> options;
  final String questionType;
  final String importance;
  final String category;
  final bool requiresDetailedInput;
  final String? detailPrompt;
  final String? detailExample;

  const AnamnesisQuestion({
    required this.questionNumber,
    required this.question,
    required this.options,
    required this.questionType,
    required this.importance,
    required this.category,
    this.requiresDetailedInput = false,
    this.detailPrompt,
    this.detailExample,
  });

  Map<String, dynamic> toJson() => {
    'questionNumber': questionNumber,
    'question': question,
    'options': options,
    'questionType': questionType,
    'importance': importance,
    'category': category,
    'requiresDetailedInput': requiresDetailedInput,
    'detailPrompt': detailPrompt,
    'detailExample': detailExample,
  };

  factory AnamnesisQuestion.fromJson(Map<String, dynamic> json) =>
      AnamnesisQuestion(
        questionNumber: json['questionNumber'] as int,
        question: json['question'] as String,
        options: (json['options'] as List).map((e) => e as String).toList(),
        questionType: json['questionType'] as String,
        importance: json['importance'] as String,
        category: json['category'] as String,
        requiresDetailedInput: json['requiresDetailedInput'] as bool? ?? false,
        detailPrompt: json['detailPrompt'] as String?,
        detailExample: json['detailExample'] as String?,
      );
}

// Complete question bank based on medical anamnesis standards
class AnamnesisQuestionsBank {
  static const List<Map<String, dynamic>> _questionsData = [
    // ==========================================
    // 1. IDENTIFIKASI PASIEN & FAKTOR RISIKO
    // ==========================================
    {
      'questionNumber': 1,
      'question': 'Berapa usia Anda saat ini?',
      'options': [
        'Di bawah 18 tahun',
        '18-40 tahun',
        '41-60 tahun',
        'Di atas 60 tahun',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Usia mempengaruhi etiologi penyakit dan risiko komplikasi',
      'category': 'identifikasi_pasien',
    },
    {
      'questionNumber': 2,
      'question': 'Apa jenis kelamin Anda?',
      'options': ['Laki-laki', 'Perempuan'],
      'questionType': 'multiple_choice',
      'importance': 'Jenis kelamin mempengaruhi prevalensi penyakit tertentu',
      'category': 'identifikasi_pasien',
    },
    {
      'questionNumber': 3,
      'question': 'Apa pekerjaan Anda sekarang?',
      'options': [
        'Bekerja di kantor/indoor',
        'Bekerja lapangan/outdoor',
        'Pekerja medis/kesehatan',
        'Tidak bekerja/pensiunan',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Pekerjaan menentukan paparan risiko okupasional',
      'category': 'identifikasi_pasien',
    },
    {
      'questionNumber': 4,
      'question':
          'Apakah Anda merokok, minum alkohol, atau terpapar polusi/kimia di lingkungan kerja?',
      'options': [
        'Ya, merokok aktif (>5 batang/hari)',
        'Ya, konsumsi alkohol rutin',
        'Ya, terpapar polusi/kimia kerja',
        'Tidak ada paparan risiko',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Paparan risiko mempengaruhi etiologi dan prognosis penyakit',
      'category': 'identifikasi_pasien',
    },

    // ==========================================
    // 2. DETAIL KELUHAN UTAMA (HPI - History of Present Illness)
    // ==========================================
    {
      'questionNumber': 5,
      'question': 'Bagaimana keluhan ini bermula?',
      'options': [
        'Tiba-tiba dalam beberapa jam',
        'Bertahap dalam 1-2 hari',
        'Bertahap dalam beberapa hari',
        'Tidak ingat kapan mulainya',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Onset gejala membedakan kondisi akut vs kronis',
      'category': 'detail_keluhan',
    },
    {
      'questionNumber': 6,
      'question': 'Apakah keluhan semakin memburuk, membaik, atau tetap sama?',
      'options': [
        'Semakin memburuk progresif',
        'Semakin membaik bertahap',
        'Tetap sama/stagnan',
        'Hilang-timbul/berfluktuasi',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Pola progres menentukan urgensi dan jenis intervensi',
      'category': 'detail_keluhan',
    },
    {
      'questionNumber': 7,
      'question': 'Apa yang memperburuk keluhan Anda?',
      'options': [
        'Aktivitas fisik/olahraga',
        'Makanan/minuman tertentu',
        'Stres atau kelelahan',
        'Tidak ada faktor yang memperburuk',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Faktor pemicu membantu identifikasi penyebab spesifik',
      'category': 'detail_keluhan',
    },
    {
      'questionNumber': 8,
      'question': 'Apa yang membuat keluhan Anda membaik atau berkurang?',
      'options': [
        'Istirahat atau tidur',
        'Obat pereda nyeri',
        'Kompres hangat/dingin',
        'Tidak ada yang membantu',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Faktor yang meringankan membantu menentukan terapi',
      'category': 'detail_keluhan',
    },
    {
      'questionNumber': 9,
      'question': 'Seberapa parah keluhan yang Anda rasakan (skala 1-10)?',
      'options': [
        'Ringan (1-3): aktivitas normal',
        'Sedang (4-6): aktivitas terganggu sedikit',
        'Berat (7-8): aktivitas sangat terganggu',
        'Sangat berat (9-10): tidak bisa beraktivitas',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Tingkat keparahan menentukan urgensi dan jenis perawatan',
      'category': 'detail_keluhan',
    },
    {
      'questionNumber': 10,
      'question':
          'Apakah keluhan muncul pada waktu tertentu atau dipicu aktivitas tertentu?',
      'options': [
        'Pagi hari saat bangun',
        'Siang/sore setelah aktivitas',
        'Malam hari/menjelang tidur',
        'Kapan saja, tidak ada pola khusus',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Pola temporal membantu diagnosis diferensial',
      'category': 'detail_keluhan',
    },

    // ==========================================
    // 3. RIWAYAT PENYAKIT DAHULU
    // ==========================================
    {
      'questionNumber': 11,
      'question':
          'Apakah Anda memiliki penyakit kronis seperti diabetes, hipertensi, asma, atau lainnya?',
      'options': [
        'Ya, saya memiliki penyakit kronis',
        'Tidak ada penyakit kronis',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Penyakit kronis meningkatkan risiko komplikasi',
      'category': 'riwayat_dahulu',
      'requiresDetailedInput': true,
      'detailPrompt':
          'Sebutkan penyakit spesifik, sejak kapan, dan pengobatan yang dijalani',
      'detailExample':
          'Contoh: Diabetes Tipe 2 sejak 2020, minum Metformin 2x500mg sehari, atau Hipertensi sejak 2018, minum Amlodipine 5mg 1x sehari',
    },
    {
      'questionNumber': 12,
      'question':
          'Apakah Anda pernah dirawat di rumah sakit atau menjalani operasi?',
      'options': ['Ya, pernah dirawat/operasi', 'Tidak pernah dirawat/operasi'],
      'questionType': 'multiple_choice',
      'importance':
          'Riwayat rawat inap menunjukkan kondisi medis serius sebelumnya',
      'category': 'riwayat_dahulu',
      'requiresDetailedInput': true,
      'detailPrompt':
          'Sebutkan jenis operasi/perawatan, kapan dilakukan, dan rumah sakit mana',
      'detailExample':
          'Contoh: Operasi usus buntu Januari 2023 di RS Siloam, atau Dirawat karena DBD Mei 2024 di RSUD 5 hari',
    },
    {
      'questionNumber': 13,
      'question': 'Apakah Anda memiliki alergi obat atau makanan?',
      'options': ['Ya, saya memiliki alergi', 'Tidak ada alergi'],
      'questionType': 'multiple_choice',
      'importance': 'Alergi mempengaruhi pilihan terapi yang aman',
      'category': 'riwayat_dahulu',
      'requiresDetailedInput': true,
      'detailPrompt':
          'Sebutkan obat/makanan spesifik yang menyebabkan alergi dan reaksi yang terjadi',
      'detailExample':
          'Contoh: Penisilin - muncul ruam merah dan gatal di seluruh tubuh, atau Udang - bengkak di wajah dan sesak napas',
    },

    // ==========================================
    // 4. RIWAYAT PENGOBATAN
    // ==========================================
    {
      'questionNumber': 14,
      'question': 'Apakah Anda sedang mengonsumsi obat-obatan tertentu?',
      'options': [
        'Ya, sedang mengonsumsi obat',
        'Tidak mengonsumsi obat apapun',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Obat saat ini mempengaruhi diagnosis dan terapi baru',
      'category': 'riwayat_obat',
      'requiresDetailedInput': true,
      'detailPrompt': 'Sebutkan nama obat, dosis, dan frekuensi konsumsi',
      'detailExample':
          'Contoh: Paracetamol 500mg 3x sehari, Amoxicillin 500mg 2x sehari, atau Vitamin C 1000mg setiap pagi',
    },
    {
      'questionNumber': 15,
      'question':
          'Apakah Anda pernah mencoba obat atau terapi untuk keluhan ini? Apa hasilnya?',
      'options': [
        'Ya, membaik dengan obat/terapi tertentu',
        'Ya, tidak ada perubahan',
        'Ya, malah memburuk',
        'Belum pernah mencoba pengobatan',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Respon terhadap terapi sebelumnya memandu pilihan terapi selanjutnya',
      'category': 'riwayat_obat',
      'requiresDetailedInput': true,
      'detailPrompt':
          'Sebutkan obat/terapi apa yang sudah dicoba dan hasilnya seperti apa',
      'detailExample':
          'Contoh: Sudah minum Paracetamol 500mg tapi demam tidak turun, atau Kompres hangat sedikit membantu mengurangi nyeri',
    },

    // ==========================================
    // 5. RIWAYAT KELUARGA
    // ==========================================
    {
      'questionNumber': 16,
      'question':
          'Apakah ada anggota keluarga yang memiliki penyakit serupa dengan keluhan Anda?',
      'options': [
        'Ya, ada anggota keluarga dengan penyakit serupa',
        'Tidak ada riwayat serupa',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Riwayat keluarga mengidentifikasi faktor genetik',
      'category': 'riwayat_keluarga',
      'requiresDetailedInput': true,
      'detailPrompt':
          'Sebutkan anggota keluarga (ayah/ibu/saudara) dan penyakit yang dimiliki',
      'detailExample':
          'Contoh: Ayah - diabetes sejak 10 tahun lalu, Ibu - hipertensi dan stroke, atau Kakak - asma sejak kecil',
    },
    {
      'questionNumber': 17,
      'question':
          'Apakah ada riwayat penyakit turunan dalam keluarga (jantung, stroke, kanker, dll.)?',
      'options': [
        'Ya, ada riwayat penyakit turunan',
        'Tidak ada riwayat penyakit turunan',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Penyakit turunan meningkatkan risiko kondisi tertentu',
      'category': 'riwayat_keluarga',
      'requiresDetailedInput': true,
      'detailPrompt': 'Sebutkan anggota keluarga dan jenis penyakit turunan',
      'detailExample':
          'Contoh: Kakek dari ayah - serangan jantung usia 65 tahun, Nenek dari ibu - kanker payudara',
    },

    // ==========================================
    // 6. RIWAYAT SOSIAL & LINGKUNGAN
    // ==========================================
    {
      'questionNumber': 18,
      'question':
          'Apakah Anda baru bepergian ke luar kota atau luar negeri dalam 2 minggu terakhir?',
      'options': ['Ya, baru bepergian', 'Tidak bepergian kemana-mana'],
      'questionType': 'multiple_choice',
      'importance':
          'Riwayat perjalanan mengidentifikasi paparan penyakit endemik atau menular',
      'category': 'sosial_lingkungan',
      'requiresDetailedInput': true,
      'detailPrompt':
          'Sebutkan ke mana, kapan (tanggal), dan berapa lama perjalanan',
      'detailExample':
          'Contoh: Ke Bali, 1-5 November 2025, 5 hari, menginap di hotel dekat pantai',
    },
    {
      'questionNumber': 19,
      'question': 'Apakah Anda memiliki hewan peliharaan di rumah?',
      'options': [
        'Ya, memiliki hewan peliharaan',
        'Tidak ada hewan peliharaan',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Hewan peliharaan dapat menjadi sumber infeksi zoonosis',
      'category': 'sosial_lingkungan',
      'requiresDetailedInput': true,
      'detailPrompt':
          'Sebutkan jenis hewan, berapa lama memelihara, dan frekuensi kontak',
      'detailExample':
          'Contoh: Kucing persia, 2 tahun, kontak setiap hari dan tidur di kamar yang sama',
    },
    {
      'questionNumber': 20,
      'question':
          'Bagaimana kondisi rumah Anda (ventilasi, sanitasi, kepadatan)?',
      'options': [
        'Baik: ventilasi cukup, bersih, tidak padat',
        'Sedang: ventilasi cukup, kebersihan standar',
        'Kurang: ventilasi buruk atau terlalu padat',
        'Buruk: lembab, kotor, atau sangat padat',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Kondisi lingkungan rumah mempengaruhi risiko penyakit tertentu',
      'category': 'sosial_lingkungan',
    },

    // ==========================================
    // 7. POLA HIDUP DAN KEBIASAAN
    // ==========================================
    {
      'questionNumber': 21,
      'question': 'Bagaimana pola tidur Anda belakangan ini?',
      'options': [
        'Baik: tidur 7-8 jam nyenyak setiap malam',
        'Cukup: tidur 5-6 jam dengan kualitas OK',
        'Kurang: tidur <5 jam atau terputus-putus',
        'Buruk: insomnia atau sering terbangun',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Kualitas tidur mempengaruhi sistem imun dan proses pemulihan',
      'category': 'pola_hidup',
    },
    {
      'questionNumber': 22,
      'question': 'Seperti apa pola makan harian Anda?',
      'options': [
        'Teratur 3x sehari dengan gizi seimbang',
        'Cukup teratur tapi tidak selalu seimbang',
        'Tidak teratur, sering telat/skip makan',
        'Buruk, sering junk food/instant',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Pola makan mempengaruhi kesehatan dan pemulihan',
      'category': 'pola_hidup',
    },
    {
      'questionNumber': 23,
      'question': 'Seberapa banyak air yang Anda minum setiap hari?',
      'options': [
        'Cukup: >8 gelas (2 liter) per hari',
        'Sedang: 4-7 gelas per hari',
        'Kurang: <4 gelas per hari',
        'Tidak pernah menghitung/perhatikan',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Hidrasi adekuat penting untuk fungsi tubuh optimal',
      'category': 'pola_hidup',
    },
    {
      'questionNumber': 24,
      'question': 'Bagaimana tingkat aktivitas fisik Anda?',
      'options': [
        'Aktif: olahraga rutin 3-5x/minggu',
        'Sedang: aktivitas ringan beberapa kali/minggu',
        'Kurang: jarang aktivitas fisik',
        'Tidak aktif: duduk/berbaring sepanjang hari',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Aktivitas fisik mempengaruhi kesehatan kardiovaskular dan metabolik',
      'category': 'pola_hidup',
    },
    {
      'questionNumber': 25,
      'question':
          'Apakah Anda sedang mengalami stres atau tekanan mental yang signifikan?',
      'options': [
        'Ya, stres berat (pekerjaan/keluarga/keuangan)',
        'Ya, stres sedang yang bisa dikelola',
        'Sedikit stres, hal wajar sehari-hari',
        'Tidak ada stres khusus',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Stres psikologis dapat mempengaruhi manifestasi gejala fisik',
      'category': 'pola_hidup',
    },

    // ==========================================
    // 8. REVIEW OF SYSTEMS (ROS)
    // ==========================================
    {
      'questionNumber': 26,
      'question': 'Apakah Anda mengalami sesak napas, batuk, atau nyeri dada?',
      'options': [
        'Ya, sesak napas terutama saat aktivitas',
        'Ya, batuk berkepanjangan >2 minggu',
        'Ya, nyeri dada atau dada terasa berat',
        'Tidak ada keluhan pernapasan',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Skrining sistem respirasi untuk mendeteksi keterlibatan paru/jantung',
      'category': 'review_systems',
    },
    {
      'questionNumber': 27,
      'question':
          'Apakah Anda mengalami mual, muntah, atau gangguan pencernaan?',
      'options': [
        'Ya, mual/muntah sering',
        'Ya, diare atau BAB tidak normal',
        'Ya, nyeri perut atau kembung',
        'Tidak ada keluhan pencernaan',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Skrining sistem gastrointestinal',
      'category': 'review_systems',
    },
    {
      'questionNumber': 28,
      'question':
          'Apakah ada sakit kepala, pusing, atau sensasi kebas/kesemutan?',
      'options': [
        'Ya, sakit kepala hebat atau berulang',
        'Ya, pusing/vertigo saat bangun/bergerak',
        'Ya, kebas/kesemutan di tangan/kaki',
        'Tidak ada keluhan neurologis',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Skrining sistem neurologis untuk mendeteksi gangguan saraf',
      'category': 'review_systems',
    },
    {
      'questionNumber': 29,
      'question': 'Apakah ada nyeri otot, sendi, atau pembengkakan?',
      'options': [
        'Ya, nyeri otot menyeluruh',
        'Ya, nyeri/bengkak pada sendi tertentu',
        'Ya, kelemahan otot atau sulit bergerak',
        'Tidak ada keluhan muskuloskeletal',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Skrining sistem muskuloskeletal',
      'category': 'review_systems',
    },
    {
      'questionNumber': 30,
      'question': 'Apakah ada gangguan buang air kecil?',
      'options': [
        'Ya, sering buang air kecil (>8x/hari)',
        'Ya, nyeri saat buang air kecil',
        'Ya, warna urin tidak normal/gelap',
        'Tidak ada gangguan BAK',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Skrining sistem urologi',
      'category': 'review_systems',
    },
    {
      'questionNumber': 31,
      'question': 'Apakah ada ruam, gatal, atau perubahan pada kulit?',
      'options': [
        'Ya, ruam atau bintik-bintik merah',
        'Ya, gatal-gatal tanpa sebab jelas',
        'Ya, perubahan warna atau tekstur kulit',
        'Tidak ada keluhan kulit',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Skrining sistem dermatologi',
      'category': 'review_systems',
    },

    // ==========================================
    // 9. RIWAYAT REPRODUKSI (untuk perempuan)
    // ==========================================
    {
      'questionNumber': 32,
      'question': 'Bagaimana pola menstruasi Anda (untuk perempuan)?',
      'options': [
        'Teratur setiap bulan',
        'Tidak teratur atau terlambat',
        'Sangat banyak atau sangat sedikit',
        'Sudah menopause/tidak relevan',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Pola menstruasi mempengaruhi diagnosis pada perempuan usia produktif',
      'category': 'reproduksi',
    },
    {
      'questionNumber': 33,
      'question': 'Apakah Anda sedang hamil atau menyusui (untuk perempuan)?',
      'options': [
        'Ya, sedang hamil',
        'Ya, sedang menyusui',
        'Tidak, tetapi merencanakan kehamilan',
        'Tidak/Tidak relevan',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Kehamilan/menyusui mempengaruhi pilihan terapi yang aman',
      'category': 'reproduksi',
    },
    {
      'questionNumber': 34,
      'question': 'Apakah Anda menggunakan alat kontrasepsi (untuk perempuan)?',
      'options': [
        'Ya, pil KB',
        'Ya, IUD/spiral',
        'Ya, metode lain (suntik, implan)',
        'Tidak menggunakan kontrasepsi',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Kontrasepsi hormonal dapat mempengaruhi beberapa kondisi medis',
      'category': 'reproduksi',
    },

    // ==========================================
    // 10. VALIDASI DAN PRIORITAS
    // ==========================================
    {
      'questionNumber': 35,
      'question':
          'Dari semua keluhan yang Anda alami, mana yang paling mengganggu aktivitas sehari-hari?',
      'options': [
        'Nyeri/sakit yang dirasakan',
        'Gangguan tidur atau kelelahan',
        'Gangguan makan atau pencernaan',
        'Gangguan mood atau mental',
      ],
      'questionType': 'multiple_choice',
      'importance': 'Keluhan utama menentukan prioritas penanganan',
      'category': 'validasi',
    },
    {
      'questionNumber': 36,
      'question':
          'Apakah ada hal lain yang penting yang belum Anda sampaikan tentang kondisi Anda?',
      'options': [
        'Ya, ada informasi penting lain',
        'Tidak, sudah cukup lengkap',
        'Tidak yakin apa yang perlu ditambahkan',
        'Tidak ada tambahan',
      ],
      'questionType': 'multiple_choice',
      'importance':
          'Memberi kesempatan pasien menyampaikan informasi yang mungkin terlewat',
      'category': 'validasi',
      'requiresDetailedInput': true,
      'detailPrompt':
          'Sebutkan informasi penting lain tentang kondisi Anda yang belum ditanyakan',
      'detailExample':
          'Contoh: Saya juga mengalami demam ringan sejak 2 hari lalu, atau ada riwayat alergi cuaca dingin',
    },
  ];

  // Get all questions
  static List<AnamnesisQuestion> getAllQuestions() {
    return _questionsData
        .map((data) => AnamnesisQuestion.fromJson(data))
        .toList();
  }

  // Get questions by category
  static List<AnamnesisQuestion> getQuestionsByCategory(String category) {
    return getAllQuestions().where((q) => q.category == category).toList();
  }

  // Get prioritized questions for diagnosis
  static List<AnamnesisQuestion> getPrioritizedQuestions(int count) {
    // Priority order based on medical importance
    const priorityOrder = [
      'detail_keluhan', // Most important
      'identifikasi_pasien',
      'riwayat_dahulu',
      'review_systems',
      'pola_hidup',
      'riwayat_obat',
      'riwayat_keluarga',
      'sosial_lingkungan',
      'reproduksi',
      'validasi', // Least priority
    ];

    final questions = <AnamnesisQuestion>[];

    for (final category in priorityOrder) {
      final categoryQuestions = getQuestionsByCategory(category);
      questions.addAll(categoryQuestions);
      if (questions.length >= count) break;
    }

    return questions.take(count).toList();
  }

  // Calculate question count based on complaint detail level
  // REVERSED LOGIC following route.ts: LESS detail = MORE questions!
  // This ensures comprehensive anamnesis for minimal complaints
  static int calculateQuestionCount(String complaint) {
    final words = complaint.trim().split(RegExp(r'\s+'));
    final wordCount = words.length;

    // Check detail indicators
    final lowerComplaint = complaint.toLowerCase();
    int detailScore = 0;

    // Word count contribution (max 40 points)
    if (wordCount < 5) {
      detailScore += 0; // Extremely brief: "demam" or "panas pusing"
    } else if (wordCount < 10) {
      detailScore += 10; // Very brief
    } else if (wordCount < 20) {
      detailScore += 20; // Brief
    } else if (wordCount < 40) {
      detailScore += 30; // Moderate
    } else {
      detailScore += 40; // Very detailed
    }

    // Timeline indicators (10 points)
    if (lowerComplaint.contains(
      RegExp(r'hari|minggu|bulan|jam|sejak|selama|kemarin|tadi'),
    )) {
      detailScore += 10;
    }

    // Intensity indicators (5 points)
    if (lowerComplaint.contains(
      RegExp(r'parah|ringan|sedang|hebat|sedikit|sangat|berat'),
    )) {
      detailScore += 5;
    }

    // Pattern indicators (5 points)
    if (lowerComplaint.contains(
      RegExp(r'kadang|sering|terus|menerus|hilang|timbul|berulang'),
    )) {
      detailScore += 5;
    }

    // Location indicators (10 points)
    if (lowerComplaint.contains(
      RegExp(r'kepala|dada|perut|kaki|tangan|punggung|leher'),
    )) {
      detailScore += 10;
    }

    // Multiple symptoms (15 points)
    int symptomCount = 0;
    final symptoms = [
      'demam',
      'batuk',
      'pilek',
      'nyeri',
      'sakit',
      'pusing',
      'mual',
      'muntah',
      'diare',
    ];
    for (final symptom in symptoms) {
      if (lowerComplaint.contains(symptom)) symptomCount++;
    }
    if (symptomCount >= 3)
      detailScore += 15;
    else if (symptomCount >= 2)
      detailScore += 10;

    // Associated symptoms (10 points)
    if (lowerComplaint.contains(RegExp(r'disertai|dengan|dan|juga|ditambah'))) {
      detailScore += 10;
    }

    // Determine question count based on detail score
    // REVERSED: LESS detail = MORE questions!
    int questionCount;

    if (detailScore >= 80) {
      questionCount = 6;
    } else if (detailScore >= 60) {
      questionCount = 9;
    } else if (detailScore >= 30) {
      questionCount = 13;
    } else {
      questionCount = 18;
    }

    return questionCount;
  }
}
