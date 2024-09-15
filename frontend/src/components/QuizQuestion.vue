<template>
  <div class="p-6 max-w-md mx-auto bg-white rounded border border-slate-200 space-y-4 mt-4">
    <h3 class="text-xl font-semibold">{{ question.question_text }}</h3>
    <form @submit.prevent="submitAnswer">
      <ul class="flex flex-col">
        <li v-for="(answer, index) in answers" :key="index" class="mb-2">
          <label class="flex items-center space-x-2">
            <input 
              type="radio" 
              name="answer" 
              :value="index" 
              v-model="selectedAnswer" 
              class="form-radio h-4 w-4 text-indigo-600" 
            />
            <span>{{ answer }}</span>
          </label>
        </li>
      </ul>
      <button 
        type="submit" 
        class="mt-4 w-full bg-indigo-600 text-white py-2 px-4 rounded-lg hover:bg-indigo-700">
        {{ currentQuestionIndex < questions.length - 1 ? 'Next' : 'Submit' }}
      </button>
    </form>
  </div>
</template>

<script>
export default {
  name: "QuizQuestion",
  props: {
    question: Object, // The question object from the parent component
    questions: Array,
    currentQuestionIndex: Number
  },
  data() {
    return {
      selectedAnswer: null, // To store the user's selected answer
    };
  },
  computed: {
    answers() {
      // Collect the answers from the question object
      return [
        this.question.answer1,
        this.question.answer2,
        this.question.answer3,
        this.question.answer4,
      ];
    },
  },
  watch: {
    // Watch for changes in the question prop
    question() {
      this.selectedAnswer = null; // Reset selected answer when the question changes
    }
  },
  methods: {
    submitAnswer() {
      if (this.selectedAnswer !== null) {
        // correct_answer is 1-based, so subtract 1 to match the 0-based index
        const isCorrect = this.selectedAnswer === (this.question.correct_answer - 1);
        this.$emit('answer', isCorrect); // Emit the answer result (true/false)
      } else {
        alert("Please select an answer.");
      }
    }
  }
};
</script>
