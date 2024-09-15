<template>
  <div>
    <h1>Login with Google</h1>
    <button @click="login">Login</button>
  </div>
</template>

<script>
export default {
  methods: {
    login() {
      window.location.href = "YOUR_GOOGLE_OAUTH_LOGIN_URL";
    }
  }
};
</script>
