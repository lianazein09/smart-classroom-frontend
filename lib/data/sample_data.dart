import '../models/lesson.dart';
import '../models/user.dart';

List<Lesson> sampleLessons = [
  Lesson(
    id: 1,
    title: 'Bab 1: Pengenalan Matematika',
    content: 'Matematika adalah ilmu yang mempelajari tentang angka, bentuk, dan pola. '
             'Dalam bab ini, kita akan belajar dasar-dasar aljabar dan geometri.',
    quiz: [
      QuizQuestion(
        question: 'Apa itu matematika?',
        options: ['Ilmu tentang bintang', 'Ilmu tentang angka dan bentuk', 'Ilmu tentang bahasa'],
        correctIndex: 1,
      ),
    ],
  ),
  Lesson(
    id: 2,
    title: 'Bab 2: Aljabar Dasar',
    content: 'Aljabar melibatkan penggunaan simbol untuk mewakili angka. '
             'Kita akan belajar variabel, persamaan, dan fungsi.',
    quiz: [
      QuizQuestion(
        question: 'Apa simbol yang digunakan untuk variabel?',
        options: ['x', '1', '+'],
        correctIndex: 0,
      ),
    ],
  ),
  Lesson(
    id: 3,
    title: 'Bab 3: Geometri',
    content: 'Geometri mempelajari tentang bentuk, ukuran, dan posisi benda di ruang. '
             'Kita akan bahas segitiga, lingkaran, dan volume.',
    quiz: [
      QuizQuestion(
        question: 'Berapa sudut dalam segitiga?',
        options: ['90 derajat', '180 derajat', '360 derajat'],
        correctIndex: 1,
      ),
    ],
  ),
];

User sampleUser = User(
  id: 1,
  name: 'Siswa',
  progress: {1: false, 2: false, 3: false},
);