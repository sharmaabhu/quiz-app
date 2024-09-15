<template>
  <div class="flex items-center justify-center h-screen">
    <div id="g_id_onload"
         data-client_id="255243316489-gvb9oahfi61pmfu4kcqdu8p9hiimdma4.apps.googleusercontent.com"
         data-callback="handleCredentialResponse"
         data-auto_prompt="false">
    </div>
    <div class="g_id_signin"
         data-type="standard"
         data-shape="rectangular"
         data-theme="outline"
         data-text="signin_with"
         data-logo_alignment="left">
    </div>
  </div>
</template>

<script>
export default {
  name: 'GoogleSignIn',
  mounted() {
    window.handleCredentialResponse = this.handleCredentialResponse;
  },
  methods: {
    handleCredentialResponse(response) {
      console.log('ID Token:', response.credential);

      // Here you can send the ID token to your backend for verification
      // Example: send to your PHP backend
      fetch('http://localhost/quiz-app/backend/google_login.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ idToken: response.credential })
      })
      .then(res => res.json())
      .then(data => {
        if (data.success) {
          sessionStorage.setItem('googleAuthToken', response.credential); // Save the token
          this.$router.push({ name: 'Home' });  // Navigate to the quiz home
        } else {
          console.error('Google Sign-In failed.');
        }
      })
      .catch(error => {
        console.error('Failed to verify token:', error);
      });
    }
  }
}
</script>
