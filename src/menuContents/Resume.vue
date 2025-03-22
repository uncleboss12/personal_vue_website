<template>
  <div class="resume-container">
    <div class="resume-header">
      <h2>My Professional Resume</h2>
      <p class="subtitle">Expertise in Cloud Architecture, DevOps Engineering, and Data Science</p>
    </div>

    <div class="resume-intro">
      <p>
        My resume highlights my professional journey across multiple domains, including:
      </p>
      <ul class="expertise-list">
        <li><span class="bullet">•</span> Cloud & DevOps Architecture</li>
        <li><span class="bullet">•</span> Data Science & Machine Learning</li>
        <li><span class="bullet">•</span> Infrastructure as Code & Automation</li>
        <li><span class="bullet">•</span> Multi-Cloud Deployment Strategies</li>
        <li><span class="bullet">•</span> CI/CD Pipeline Implementation</li>
      </ul>
    </div>

    <div class="repository-section">
      <h3>Access My Resume</h3>
      <p>
        My comprehensive, up-to-date resume is maintained in a dedicated GitHub repository. This ensures you always 
        have access to the most current version of my professional credentials and experience.
      </p>
      
      <div class="resume-links">
        <a href="https://github.com/https://github.com/uncleboss12/my-resume" target="_blank" class="github-button">
          <div class="github-icon">
            <svg height="24" viewBox="0 0 16 16" width="24" aria-hidden="true">
              <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
            </svg>
          </div>
          <span>GitHub Repository</span>
        </a>
        <a href="https://https://github.com/uncleboss12/my-resume/raw/main/Justine_Obiazi_Resume.pdf" target="_blank" class="pdf-button">
          <div class="pdf-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
              <polyline points="14 2 14 8 20 8"></polyline>
              <line x1="16" y1="13" x2="8" y2="13"></line>
              <line x1="16" y1="17" x2="8" y2="17"></line>
              <polyline points="10 9 9 9 8 9"></polyline>
            </svg>
          </div>
          <span>Download PDF</span>
        </a>
      </div>
    </div>

    <div class="resume-formats">
      <h3>Available Formats</h3>
      <p>My resume is available in multiple formats to suit your needs:</p>
      <div class="format-options">
        <div class="format">
          <h4>PDF Format</h4>
          <p>Standard downloadable version for printing or saving locally.</p>
          <a href="https://github.com/uncleboss12/my-resume/raw/main/Justine_Obiazi_Resume.pdf" target="_blank">Download PDF</a>
        </div>
        <div class="format">
          <h4>Word Document</h4>
          <p>Microsoft Word format for when you need an editable version.</p>
          <a href="https://github.com/uncleboss12/my-resume/raw/refs/heads/main/Justine_Obiazi_Resume.docx" target="_blank">Download DOCX</a>
        </div>
        <div class="format">
          <h4>Markdown</h4>
          <p>Text-based format viewable directly on GitHub.</p>
          <a href="https://github.com/uncleboss12/my-resume/blob/main/README.md" target="_blank">View Online</a>
        </div>
      </div>
    </div>

    <div class="resume-note">
      <h3>Why GitHub for My Resume?</h3>
      <p>
        By hosting my resume on GitHub, I'm leveraging version control to maintain a single source of truth for my professional history.
        This approach demonstrates my technical workflow while ensuring you always have access to my most current credentials.
      </p>
      <p>
        Feel free to star the repository if you find my qualifications interesting, or reach out via the contact information provided
        in my resume for professional opportunities.
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ResumePage',
}
</script>

<style scoped>
.resume-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 20px;
}

.resume-header {
  text-align: center;
  margin-bottom: 30px;
  border-bottom: 1px solid #e9ecef;
  padding-bottom: 20px;
}

.resume-header h2 {
  color: #1a73e8;
  margin-bottom: 10px;
  font-size: 2rem;
}

.subtitle {
  color: #555;
  font-size: 1.1rem;
}

.resume-intro {
  margin-bottom: 30px;
  background-color: #f8f9fa;
  padding: 25px;
  border-radius: 8px;
}

.resume-intro p {
  margin-bottom: 15px;
  line-height: 1.6;
}

.expertise-list {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px 30px;
  list-style-type: none;
  padding: 0;
}

@media (max-width: 600px) {
  .expertise-list {
    grid-template-columns: 1fr;
  }
}

.expertise-list li {
  display: flex;
  align-items: center;
  line-height: 1.4;
}

.bullet {
  color: #1a73e8;
  margin-right: 10px;
  font-weight: bold;
}

.repository-section {
  background-color: #e8f0fe;
  padding: 25px;
  border-radius: 8px;
  margin-bottom: 30px;
}

.repository-section h3 {
  color: #1a73e8;
  margin-bottom: 15px;
}

.repository-section p {
  margin-bottom: 20px;
  line-height: 1.6;
}

.resume-links {
  display: flex;
  gap: 20px;
  margin-top: 25px;
  flex-wrap: wrap;
}

.github-button, .pdf-button {
  display: flex;
  align-items: center;
  padding: 12px 20px;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s;
}

.github-button {
  background-color: #24292e;
  color: white;
}

.pdf-button {
  background-color: #d93025;
  color: white;
}

.github-button:hover, .pdf-button:hover {
  transform: translateY(-3px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.github-icon, .pdf-icon {
  margin-right: 10px;
}

.resume-formats {
  margin-bottom: 30px;
}

.resume-formats h3 {
  color: #1a73e8;
  margin-bottom: 15px;
}

.format-options {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin-top: 20px;
}

.format {
  background-color: white;
  border: 1px solid #e9ecef;
  border-radius: 8px;
  padding: 20px;
}

.format h4 {
  color: #1a73e8;
  margin-bottom: 10px;
}

.format p {
  margin-bottom: 15px;
  font-size: 0.95rem;
  color: #555;
}

.format a {
  display: inline-block;
  color: #1a73e8;
  text-decoration: none;
  font-weight: 500;
  border-bottom: 2px solid transparent;
  transition: all 0.2s;
}

.format a:hover {
  border-bottom: 2px solid #1a73e8;
}

.resume-note {
  background-color: #f8f9fa;
  padding: 25px;
  border-radius: 8px;
  border-left: 4px solid #1a73e8;
}

.resume-note h3 {
  color: #1a73e8;
  margin-bottom: 15px;
}

.resume-note p {
  line-height: 1.6;
  margin-bottom: 15px;
}

.resume-note p:last-child {
  margin-bottom: 0;
}
</style>