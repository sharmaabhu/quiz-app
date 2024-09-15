// src/router.js
import { createRouter, createWebHistory } from 'vue-router';
import Home from './components/QuizHome.vue';
import QuizPage from './components/QuizPage.vue';
import GoogleSignIn from './GoogleSignIn.vue';

const routes = [
  { path: '/', name: 'Login', component: GoogleSignIn },
  { path: '/quiz-home', name: 'Home', component: Home },  
  { path: '/quiz', name: 'Dashboard', component: QuizPage }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

// Navigation Guard to ensure the user is authenticated
router.beforeEach((to, from, next) => {
  // If the route requires authentication and the user isn't authenticated
  const isAuthenticated = sessionStorage.getItem('googleAuthToken'); // Replace with your token logic
  if (to.matched.some(record => record.meta.requiresAuth) && !isAuthenticated) {
    next({ name: 'Login' }); // Redirect to the login page
  } else {
    next(); // Continue to the requested route
  }
});

export default router;