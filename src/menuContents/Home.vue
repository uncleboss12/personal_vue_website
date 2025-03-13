<template>
  <div class="home-container">
    <div class="welcome-section">
      <h1>Welcome to My Professional Portfolio</h1>
      <p class="intro">
        Hello, I'm <span class="highlight">Justine Obiazi</span>, a Civil Engineer specializing in 
        Cloud & DevOps Architecture, Data Science, and Data Engineering.
      </p>
      
      <div class="welcome-message">
        <p>
          Thank you for visiting my personal website! Here you'll find information about my professional 
          background, technical expertise, and projects across various disciplines including cloud computing, 
          data science, and DevOps engineering.
        </p>
        <p>
          Feel free to explore my certifications, review my resume, and check out the various projects 
          I've worked on. I'm passionate about continuous learning and applying technology to solve 
          real-world problems.
        </p>
      </div>
      
      <div class="cta-section">
        <h3>Let's Connect!</h3>
        <p>
          Follow me on LinkedIn and GitHub to stay updated on my latest projects and professional journey:
        </p>
        <div class="social-links">
          <a href="https://www.linkedin.com/in/justine-obiazi-a0363075" target="_blank" class="social-button linkedin">
            <span class="icon">in</span>
            <span class="text">LinkedIn</span>
          </a>
          <a href="https://github.com/uncleboss12" target="_blank" class="social-button github">
            <span class="icon">
              <svg height="16" viewBox="0 0 16 16" width="16" aria-hidden="true">
                <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
              </svg>
            </span>
            <span class="text">GitHub</span>
          </a>
        </div>
      </div>
    </div>
    <div class="labs-section">
      <h3>My Labs</h3>
      <p>Check out the labs I've completed on various platforms:</p>
      <div class="labs-links">
        <a href="https://www.cloudskillsboost.google/public_profiles/f2189c0f-a033-4370-9172-5ce0d3285eed" target="_blank" class="lab-button gcp">
          <span class="icon">☁️</span>
          <span class="text">GCP Skill Boost</span>
        </a>
        <a href="https://docs.microsoft.com/en-us/users/JustineObiazi-2590" target="_blank" class="lab-button azure">
          <span class="icon">☁️</span>
            <span class="text">Microsoft Learn</span>
          </a>
          <a href="https://www.credly.com/users/justine-obiazi" target="_blank" class="lab-button credly">
            <span class="icon">☁️</span>
            <span class="text">Credly</span>
        </a>
      </div>
    </div>
    <div class="featured-content">
      <h3>Featured Highlights</h3>
      <div class="feature-cards">
        <div class="feature-card" @click="navigateTo('CertificationPage')">
          <div class="card-icon">🏆</div>
          <h4>Cloud Certifications</h4>
          <p>View my multi-cloud credentials across AWS, GCP, Azure, and more</p>
        </div>
        <div class="feature-card" @click="navigateTo('ProjectsPage')">
          <div class="card-icon">💻</div>
          <h4>Technical Projects</h4>
          <p>Explore projects in data science, DevOps, and cloud architecture</p>
        </div>
        <div class="feature-card" @click="navigateTo('BlogPage')">
          <div class="card-icon">📝</div>
          <h4>Technical Blog</h4>
          <p>Read about my insights and experiences in tech</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  methods: {
    navigateTo(view) {
      // This assumes you're using a state management pattern or event bus
      // If not, you might need to emit an event to the parent component
      this.$parent.currentView = view;
    }
  }
};
</script>

<style scoped>
.home-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

.welcome-section {
  margin-bottom: 40px;
  background-color: #f8f9fa;
  padding: 30px;
  border-radius: 8px;
  border-left: 5px solid #1a73e8;
}

h1 {
  color: #1a73e8;
  margin-bottom: 20px;
}

.intro {
  font-size: 1.2rem;
  margin-bottom: 20px;
  color: #333;
}

.highlight {
  color: #1a73e8;
  font-weight: 500;
}

.welcome-message {
  margin-bottom: 25px;
  line-height: 1.6;
}

.welcome-message p {
  margin-bottom: 15px;
}

.cta-section {
  background-color: #e8f0fe;
  padding: 20px;
  border-radius: 6px;
}

.cta-section h3 {
  color: #1a73e8;
  margin-bottom: 10px;
}

.social-links {
  display: flex;
  gap: 15px;
  margin-top: 15px;
}

.social-button {
  display: inline-flex;
  align-items: center;
  padding: 8px 16px;
  border-radius: 4px;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s ease;
}

.linkedin {
  background-color: #0077b5;
  color: white;
}

.github {
  background-color: #24292e;
  color: white;
}

.social-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.icon {
  margin-right: 8px;
  display: flex;
  align-items: center;
}

.featured-content {
  margin-top: 40px;
}

.featured-content h3 {
  color: #1a73e8;
  margin-bottom: 20px;
  text-align: center;
}

.feature-cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
}

.feature-card {
  background-color: white;
  border: 1px solid #e9ecef;
  border-radius: 8px;
  padding: 20px;
  text-align: center;
  cursor: pointer;
  transition: all 0.2s ease;
}

.feature-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
  border-color: #1a73e8;
}

.card-icon {
  font-size: 2rem;
  margin-bottom: 15px;
}

.feature-card h4 {
  color: #1a73e8;
  margin-bottom: 10px;
}

.feature-card p {
  color: #555;
  font-size: 0.9rem;
}

@media (max-width: 768px) {
  .social-links {
    flex-direction: column;
    gap: 10px;
  }
  
  .feature-cards {
    grid-template-columns: 1fr;
  }
}
</style>