<template>
  <div class="flex flex-col items-center justify-center h-screen">
    <h2 class="text-2xl text-indigo-800 font-semibold text-center">{{ topic_other }} Quiz</h2>
    <!-- Display the current question -->
    <QuizQuestion
      v-if="!quizCompleted && currentQuestionIndex < questions.length"
      :currentQuestionIndex="currentQuestionIndex"
      :questions="questions"
      :question="questions[currentQuestionIndex]"
      @answer="handleAnswer"
    />

    <!-- Show the result after all questions are answered -->
    <QuizResult
      v-if="quizCompleted"
      :score="score"
      :total="questions.length"
    />
  </div>
</template>

<script>
import QuizQuestion from './QuizQuestion.vue';
import QuizResult from './QuizResult.vue';

export default {
  components: { QuizQuestion, QuizResult },
  props: {
    topic: {
      type: String,
      required: true
    },
  },
  data() {
    return {
      questions: [],  
      currentQuestionIndex: 0,
      answers: {},  // Store user answers in localStorage
      score: 0,
      quizCompleted: false,
    };
  },
  computed: {
    topic_other() {
      switch (this.topic) {
        case "1":
          return "Sports";
        case "2":
          return "Science & Technology";
        case "3":
          return "Arts";
        case "4":
          return "Politics";
        default:
          return "";
      }
    }
  },
  methods: {
    async fetchQuestions() {
      const topicId = this.topic;
      const url = `http://localhost/quiz-app/backend/get-questions.php?topic=${topicId}`;  // PHP backend URL
      try {
        const response = await fetch(url);
        this.questions = await response.json();

        // Load any saved answers from localStorage
        const savedAnswers = JSON.parse(localStorage.getItem('quiz-answers')) || {};
        this.answers = savedAnswers;
      } catch (error) {
        console.error("Failed to fetch questions:", error);
      }
    },

    handleAnswer(selectedAnswer) {
      const currentQuestionId = this.questions[this.currentQuestionIndex].id;

      // Store the selected answer for the current question in the answers object
      this.answers[currentQuestionId] = selectedAnswer;

      // Save the answers object in localStorage
      localStorage.setItem('quiz-answers', JSON.stringify(this.answers));

      // Move to the next question
      if (this.currentQuestionIndex < this.questions.length - 1) {
        this.currentQuestionIndex++;
      } else {
        // All questions are answered, submit the quiz
        this.submitQuiz();
      }
    },

    async submitQuiz() {
      const url = 'http://localhost/quiz-app/backend/submit_quiz.php';

      try {
        const response = await fetch(url, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ answers: this.answers })
        });

        const result = await response.json();
        this.score = result.score;
        this.quizCompleted = true;

        // Clear the answers from localStorage after submission
        localStorage.removeItem('quiz-answers');
      } catch (error) {
        console.error("Failed to submit quiz:", error);
      }
    },
  },
  created() {
    this.fetchQuestions();
  },
};
</script>