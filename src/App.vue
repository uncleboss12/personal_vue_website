<template>
  <div id="app">
    <div class="top-menu">
      <div class="menu-item" @click="currentView = 'HomePage'">Home</div>
      <div class="menu-item" @click="currentView = 'AboutPage'">About</div>
      <div class="menu-item" @click="currentView = 'ResumePage'">Resume</div>
      <div class="menu-item" @click="currentView = 'CertificationPage'">Certification</div>
      <div class="menu-item" @click="currentView = 'ProjectsPage'">Projects</div>
      <div class="menu-item" @click="currentView = 'BlogPage'">Blog</div>
    </div>
    <div class="content">
      <component :is="currentView"></component>
    </div>
    <footer>
      <p>@2025 | Contact: justineobiazi@gmail.com</p>
    </footer>
  </div>
</template>

<script>
import HomePage from './menuContents/Home.vue';
import AboutPage from './menuContents/About.vue';
import ResumePage from './menuContents/Resume.vue';
import CertificationPage from './menuContents/Certification.vue';
import ProjectsPage from './menuContents/Projects.vue';
import BlogPage from './menuContents/Blog.vue';

export default {
  name: 'App',
  data() {
    return {
      isSidebarOpen: false,
      currentView: 'HomePage',
    };
  },
  components: {
    HomePage,
    AboutPage,
    ResumePage,
    CertificationPage,
    ProjectsPage,
    BlogPage,
  },
  methods: {
    toggleSidebar() {
      this.isSidebarOpen = !this.isSidebarOpen;
    },
  },
};
</script>

<style>
#app {
  font-family: 'Arial', sans-serif;
  color: #333;
  background: linear-gradient(to right, #ff7e5f, #feb47b);
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.top-menu {
  display: flex;
  justify-content: space-around;
  background-color: #2c3e50;
  padding: 10px;
  color: white;
}

.menu-item {
  padding: 10px;
  background-color: #34495e;
  border-radius: 5px;
  cursor: pointer;
}

.menu-item:hover {
  background-color: #1abc9c;
}

.content {
  padding: 20px;
  flex-grow: 1;
}

footer {
  background-color: #2c3e50;
  color: white;
  text-align: center;
  padding: 10px;
}
</style>