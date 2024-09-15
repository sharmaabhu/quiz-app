<template>
  <QuizContainer :topic="topic" :level="level" />
</template>

<script>
import QuizContainer from './QuizContainer.vue';

export default {
  components: { QuizContainer },
  computed: {
    topic() {
      return this.$route.query.topic;
    },
    level() {
      return this.$route.query.level;
    },
  },
};
</script>
