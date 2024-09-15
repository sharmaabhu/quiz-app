<template>
  <div id="quiz-home" class="flex flex-col items-center justify-center h-screen">
    <h1 class="text-2xl color-red-500">Choose a Quiz</h1>
    <div class="max-w-sm mx-auto">
      <label for="topic" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select Topic:</label>
      <select v-model="selectedTopic" id="topic"
        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        <option v-for="topic in topics" :key="topic.id" :value="topic.id">{{ topic.topic }}</option>
      </select>
    </div>
    <button class="text-xl mt-4 bg-indigo-600 text-white py-2 px-4 rounded-lg hover:bg-indigo-700"
      @click="startQuiz">Start Quiz</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedTopic: 1,  // Default topic
      topics: [],        // Array to hold the topics
    };
  },
  methods: {
    async fetchTopics() {
      const url = 'http://localhost/quiz-app/backend/get-topics.php';  // PHP backend URL
      try {
        const response = await fetch(url);
        this.topics = await response.json();
      } catch (error) {
        console.error("Failed to fetch topics:", error);
      }
    },
    startQuiz() {
      this.$router.push({
        path: '/quiz',
        query: { topic: this.selectedTopic }
      });
    },
  },
  created() {
    this.fetchTopics();  // Fetch topics when the component is created
  },
};
</script>
