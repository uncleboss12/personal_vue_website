<template>
  <div id="app">
    <div class="sidebar">
      <div class="logo">
        <h2 v-if="!isSidebarCollapsed">Justine Webpage</h2>
        <h2 v-else>JW</h2>
      </div>
      <div class="menu-items">
        <div class="menu-item" :class="{ active: currentView === 'HomePage' }" @click="currentView = 'HomePage'">
          <span class="menu-icon">🏠</span>
          <span class="menu-text">Home</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'AboutPage' }" @click="currentView = 'AboutPage'">
          <span class="menu-icon">👤</span>
          <span class="menu-text">About</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'ResumePage' }" @click="currentView = 'ResumePage'">
          <span class="menu-icon">📄</span>
          <span class="menu-text">Resume</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'CertificationPage' }" @click="currentView = 'CertificationPage'">
          <span class="menu-icon">🏆</span>
          <span class="menu-text">Certification</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'ProjectsPage' }" @click="currentView = 'ProjectsPage'">
          <span class="menu-icon">💻</span>
          <span class="menu-text">Projects</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'BlogPage' }" @click="currentView = 'BlogPage'">
          <span class="menu-icon">📝</span>
          <span class="menu-text">Blog</span>
        </div>
      </div>
    </div>
    
    <div class="main-content">
      <div class="header">
        <div class="menu-button" @click="toggleMobileSidebar">☰</div>
        <h1>My Personal Website</h1>
      </div>
      <div class="content">
        <component :is="currentView"></component>
      </div>
      <footer>
        <p>@2025 | Contact: justineobiazi@gmail.com</p>
      </footer>
    </div>
    
    <!-- Mobile sidebar overlay -->
    <div class="mobile-sidebar-overlay" v-if="isMobileSidebarOpen" @click="toggleMobileSidebar"></div>
    <div class="mobile-sidebar" :class="{ open: isMobileSidebarOpen }">
      <div class="close-button" @click="toggleMobileSidebar">×</div>
      <div class="menu-items">
        <div class="menu-item" :class="{ active: currentView === 'HomePage' }" @click="currentView = 'HomePage'; toggleMobileSidebar()">
          <span class="menu-icon">🏠</span>
          <span class="menu-text">Home</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'AboutPage' }" @click="currentView = 'AboutPage'; toggleMobileSidebar()">
          <span class="menu-icon">👤</span>
          <span class="menu-text">About</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'ResumePage' }" @click="currentView = 'ResumePage'; toggleMobileSidebar()">
          <span class="menu-icon">📄</span>
          <span class="menu-text">Resume</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'CertificationPage' }" @click="currentView = 'CertificationPage'; toggleMobileSidebar()">
          <span class="menu-icon">🏆</span>
          <span class="menu-text">Certification</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'ProjectsPage' }" @click="currentView = 'ProjectsPage'; toggleMobileSidebar()">
          <span class="menu-icon">💻</span>
          <span class="menu-text">Projects</span>
        </div>
        <div class="menu-item" :class="{ active: currentView === 'BlogPage' }" @click="currentView = 'BlogPage'; toggleMobileSidebar()">
          <span class="menu-icon">📝</span>
          <span class="menu-text">Blog</span>
        </div>
      </div>
    </div>
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
      isMobileSidebarOpen: false,
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
    toggleMobileSidebar() {
      this.isMobileSidebarOpen = !this.isMobileSidebarOpen;
    },
  },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Arial', sans-serif;
}

#app {
  font-family: 'Roboto', 'Arial', sans-serif;
  color: #333;
  background-color: white;
  min-height: 100vh;
  display: flex;
}

/* Sidebar styles */
.sidebar {
  width: 250px;
  background-color: #f8f9fa;
  border-right: 1px solid #e9ecef;
  height: 100vh;
  position: fixed;
  left: 0;
  top: 0;
  display: flex;
  flex-direction: column;
}

.logo {
  padding: 20px 15px;
  border-bottom: 1px solid #e9ecef;
}

.logo h2 {
  font-size: 1.2rem;
  color: #1a73e8;
}

.menu-items {
  padding: 15px 0;
}

.menu-item {
  padding: 12px 15px;
  display: flex;
  align-items: center;
  cursor: pointer;
  transition: background-color 0.2s;
}

.menu-item:hover {
  background-color: #e8f0fe;
}

.menu-item.active {
  background-color: #e8f0fe;
  color: #1a73e8;
  font-weight: 500;
  border-left: 3px solid #1a73e8;
}

.menu-icon {
  margin-right: 15px;
}

/* Main content styles */
.main-content {
  flex: 1;
  margin-left: 250px;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.header {
  padding: 15px 20px;
  border-bottom: 1px solid #e9ecef;
  display: flex;
  align-items: center;
}

.menu-button {
  display: none;
  font-size: 20px;
  margin-right: 15px;
  cursor: pointer;
}

.content {
  padding: 20px;
  flex-grow: 1;
}

footer {
  background-color: #f8f9fa;
  text-align: center;
  padding: 15px;
  border-top: 1px solid #e9ecef;
}

/* Mobile sidebar styles */
.mobile-sidebar {
  position: fixed;
  top: 0;
  left: 0;
  width: 250px;
  height: 100vh;
  background-color: white;
  z-index: 1000;
  transform: translateX(-100%);
  transition: transform 0.3s ease;
  box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
}

.mobile-sidebar.open {
  transform: translateX(0);
}

.mobile-sidebar-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 999;
}

.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 24px;
  cursor: pointer;
}

/* Media queries for responsive layout */
@media (max-width: 768px) {
  .sidebar {
    display: none;
  }

  .main-content {
    margin-left: 0;
  }

  .menu-button {
    display: block;
  }
}
</style>