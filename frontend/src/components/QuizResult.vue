<template>
  <div class="text-center">
    <h2 class="text-2xl">Quiz Completed</h2>
    <p class="text-xl">Your Score: {{ score }} / {{ total }}</p>
  </div>
</template>

<script>
export default {
  props: {
    score: Number,
    total: Number,
  },
};
</script>
