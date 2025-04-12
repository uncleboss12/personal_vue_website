<template>
  <div class="projects-container">
    <div class="projects-header">
      <h2>My Technical Projects</h2>
      <p class="subtitle">Showcasing my work in Cloud, DevOps, Data Science and Data Engineering</p>
    </div>

    <!-- Filter Controls -->
    <div class="filter-controls">
      <button 
        v-for="category in categories" 
        :key="category.id" 
        class="filter-button" 
        :class="{ active: activeFilter === category.id }"
        @click="filterProjects(category.id)">
        {{ category.name }}
      </button>
    </div>

    <!-- Data Science Projects -->
    <div class="project-category" v-show="activeFilter === 'all' || activeFilter === 'data-science'">
      <div class="category-header">
        <div class="category-icon">📊</div>
        <h3>Data Science Projects</h3>
      </div>
      <div class="projects-grid">
        <div class="project-card" v-for="project in dataScienceProjects" :key="project.id">
          <div class="project-image">
            <img v-if="project.image" :src="project.image" :alt="project.title" />
            <div v-else class="image-placeholder">
              <span>DS</span>
            </div>
          </div>
          <div class="project-details">
            <h4>{{ project.title }}</h4>
            <p class="project-description">{{ project.description }}</p>
            <div class="tech-tags">
              <span class="tech-tag" v-for="(tech, index) in project.technologies" :key="index">{{ tech }}</span>
            </div>
            <div class="project-links">
              <a :href="project.githubUrl" target="_blank" class="github-link">
                <svg height="18" viewBox="0 0 16 16" width="18" aria-hidden="true">
                  <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
                </svg>
                Repository
              </a>
              <a v-if="project.demoUrl" :href="project.demoUrl" target="_blank" class="demo-link">Live Demo</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Data Engineering Projects -->
    <div class="project-category" v-show="activeFilter === 'all' || activeFilter === 'data-engineering'">
      <div class="category-header">
        <div class="category-icon">🔄</div>
        <h3>Data Engineering Projects</h3>
      </div>
      <div class="projects-grid">
        <div class="project-card" v-for="project in dataEngineeringProjects" :key="project.id">
          <div class="project-image">
            <img v-if="project.image" :src="project.image" :alt="project.title" />
            <div v-else class="image-placeholder">
              <span>DE</span>
            </div>
          </div>
          <div class="project-details">
            <h4>{{ project.title }}</h4>
            <p class="project-description">{{ project.description }}</p>
            <div class="tech-tags">
              <span class="tech-tag" v-for="(tech, index) in project.technologies" :key="index">{{ tech }}</span>
            </div>
            <div class="project-links">
              <a :href="project.githubUrl" target="_blank" class="github-link">
                <svg height="18" viewBox="0 0 16 16" width="18" aria-hidden="true">
                  <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
                </svg>
                Repository
              </a>
              <a v-if="project.demoUrl" :href="project.demoUrl" target="_blank" class="demo-link">Live Demo</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- DevOps Projects -->
    <div class="project-category" v-show="activeFilter === 'all' || activeFilter === 'devops'">
      <div class="category-header">
        <div class="category-icon">⚙️</div>
        <h3>DevOps Projects</h3>
      </div>
      <div class="projects-grid">
        <div class="project-card" v-for="project in devOpsProjects" :key="project.id">
          <div class="project-image">
            <img v-if="project.image" :src="project.image" :alt="project.title" />
            <div v-else class="image-placeholder">
              <span>DO</span>
            </div>
          </div>
          <div class="project-details">
            <h4>{{ project.title }}</h4>
            <p class="project-description">{{ project.description }}</p>
            <div class="tech-tags">
              <span class="tech-tag" v-for="(tech, index) in project.technologies" :key="index">{{ tech }}</span>
            </div>
            <div class="project-links">
              <a :href="project.githubUrl" target="_blank" class="github-link">
                <svg height="18" viewBox="0 0 16 16" width="18" aria-hidden="true">
                  <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
                </svg>
                Repository
              </a>
              <a v-if="project.demoUrl" :href="project.demoUrl" target="_blank" class="demo-link">Live Demo</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Cloud Projects -->
    <div class="project-category" v-show="activeFilter === 'all' || activeFilter === 'cloud'">
      <div class="category-header">
        <div class="category-icon">☁️</div>
        <h3>Cloud Architecture Projects</h3>
      </div>
      <div class="projects-grid">
        <div class="project-card" v-for="project in cloudProjects" :key="project.id">
          <div class="project-image">
            <img v-if="project.image" :src="project.image" :alt="project.title" />
            <div v-else class="image-placeholder">
              <span>CA</span>
            </div>
          </div>
          <div class="project-details">
            <h4>{{ project.title }}</h4>
            <p class="project-description">{{ project.description }}</p>
            <div class="tech-tags">
              <span class="tech-tag" v-for="(tech, index) in project.technologies" :key="index">{{ tech }}</span>
            </div>
            <div class="project-links">
              <a :href="project.githubUrl" target="_blank" class="github-link">
                <svg height="18" viewBox="0 0 16 16" width="18" aria-hidden="true">
                  <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
                </svg>
                Repository
              </a>
              <a v-if="project.demoUrl" :href="project.demoUrl" target="_blank" class="demo-link">Live Demo</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- GitHub Profile Section -->
    <div class="github-profile-section">
      <h3>More Projects on GitHub</h3>
      <p>
        These are just highlights of my work. Visit my GitHub profile to see my complete portfolio 
        of projects, contributions, and ongoing work.
      </p>
      <a href="https://github.com/uncleboss12" target="_blank" class="github-profile-button">
        <svg height="24" viewBox="0 0 16 16" width="24" aria-hidden="true">
          <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
        </svg>
        View GitHub Profile
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ProjectsPage',
  data() {
    return {
      activeFilter: 'all',
      categories: [
        { id: 'all', name: 'All Projects' },
        { id: 'data-science', name: 'Data Science' },
        { id: 'data-engineering', name: 'Data Engineering' },
        { id: 'devops', name: 'DevOps' },
        { id: 'cloud', name: 'Cloud Architecture' }
      ],
      dataScienceProjects: [
        {
          id: 'ds1',
          title: 'Car price prediction model',
          description: 'Machine learning models to predict car prices from historical data.',
          image: null, // Replace with your image path
          technologies: ['Python', 'TensorFlow', 'Pandas', 'Scikit-learn', 'XGBoost', 'Random Forest'],
          githubUrl: 'https://https://github.com/uncleboss12/Machine_learning_Projects',
          demoUrl: null
        },
        {
          id: 'ds2',
          title: 'Building Rag project with foundation Model from scratch',
          description: 'Using Generative AI Foundation models to build a Chat bot assistant for customer service applications.',
          image: null, // Replace with your image path
          technologies: ['Mistra', 'Python', 'TensorFlow', 'Pandas','ElasticSearch', 'LSTM'],
          githubUrl: 'https://https://github.com/uncleboss12/LLM-Zoomcamp-Justine',
          demoUrl: null
        }
      ],
      dataEngineeringProjects: [
        {
          id: 'de1',
          title: 'Real-time Data Pipeline with Docker-Postgres-Spark-terraform-MageAI',
          description: 'Scalable data pipeline for processing streaming data using  Spark Postgres built with docker-compose.',
          image: null, // Replace with your image path
          technologies: ['Docker', 'Spark Streaming', 'Python', 'AWS', 'Terraform', 'Postgres-sql'],
          githubUrl: 'https://github.com/uncleboss12/justineZoomCamp2024',
          demoUrl: null
        }
      ],
      devOpsProjects: [
        {
          id: 'do1',
          title: 'Migrate-Existing-Prometheus-Monitoring-Workloads',
          description: 'Automated CI/CD pipeline for a microservices architecture using Jenkins, Docker, and Kubernetes.',
          image: null, // Replace with your image path
          technologies: ['git actions', 'Docker', 'Kubernetes', 'AWS EKS', 'GCP GKS'],
          githubUrl: 'https://github.com/uncleboss12/Migrate-Existing-Prometheus-Monitoring-Workloads',
          demoUrl: null
        },
        {
          id: 'do2',
          title: 'Infrastructure as Code with Terraform',
          description: 'Cloud infrastructure provisioning and management using Terraform and GitOps principles.',
          image: null, // Replace with your image path
          technologies: ['Terraform', 'AWS', 'GCP','GitOps', 'GitHub Actions'],
          githubUrl: 'https://https://github.com/uncleboss12/terraform_projects',
          demoUrl: null
        }
        
      ],
      cloudProjects: [
        {
          id: 'ca1',
          title: 'Multi-Cloud Web Application',
          description: 'Fault-tolerant web application deployed across multiple cloud providers with automated failover.',
          image: null, // Replace with your image path
          technologies: ['AWS', 'GCP', 'Kubernetes']
          githubUrl: 'https://github.com/uncleboss12/Kubernetes-and-Docker-Projects-Using-CloudProviders',
          demoUrl: null
        },
        {
          id: 'ca2',
          title: 'Serverless Data Processing for Website Visitors',
          description: 'Serverless architecture for real-time data processing and analytics using cloud functions.',
          image: null, // Replace with your image path
          technologies: ['AWS Lambda', 'DynamoDB', 'API Gateway', 'CloudWatch', 'S3'],
          githubUrl: 'Private-Repo',
        }
      ]
    };
  },
  methods: {
    filterProjects(categoryId) {
      this.activeFilter = categoryId;
    }
  }
};
</script>

<style scoped>
.projects-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

.projects-header {
  text-align: center;
  margin-bottom: 30px;
}

.projects-header h2 {
  color: #1a73e8;
  margin-bottom: 10px;
  font-size: 2rem;
}

.subtitle {
  color: #555;
  font-size: 1.1rem;
}

.filter-controls {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 30px;
  justify-content: center;
}

.filter-button {
  background-color: #f8f9fa;
  border: 1px solid #e9ecef;
  color: #333;
  padding: 8px 15px;
  border-radius: 20px;
  cursor: pointer;
  font-size: 0.9rem;
  transition: all 0.2s ease;
}

.filter-button.active {
  background-color: #1a73e8;
  color: white;
  border-color: #1a73e8;
}

.filter-button:hover:not(.active) {
  background-color: #e8f0fe;
}

.project-category {
  margin-bottom: 40px;
  animation: fadeIn 0.5s ease;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}

.category-header {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  border-bottom: 2px solid #e9ecef;
  padding-bottom: 10px;
}

.category-icon {
  font-size: 1.8rem;
  margin-right: 15px;
}

.category-header h3 {
  color: #333;
  margin: 0;
  font-size: 1.4rem;
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(450px, 1fr));
  gap: 25px;
}

@media (max-width: 768px) {
  .projects-grid {
    grid-template-columns: 1fr;
  }
}

.project-card {
  border: 1px solid #e9ecef;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
  transition: all 0.3s ease;
  background-color: white;
}

.project-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.project-image {
  height: 200px;
  overflow: hidden;
  background-color: #f8f9fa;
  display: flex;
  align-items: center;
  justify-content: center;
}

.project-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.image-placeholder {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #aaa;
  font-size: 2rem;
  font-weight: bold;
  background-color: #f0f4f8;
}

.project-details {
  padding: 20px;
}

.project-details h4 {
  color: #1a73e8;
  margin: 0 0 10px 0;
  font-size: 1.2rem;
}

.project-description {
  margin-bottom: 15px;
  color: #555;
  line-height: 1.5;
}

.tech-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 15px;
}

.tech-tag {
  background-color: #e8f0fe;
  color: #1a73e8;
  padding: 4px 10px;
  border-radius: 12px;
  font-size: 0.8rem;
}

.project-links {
  display: flex;
  gap: 15px;
}

.github-link, .demo-link {
  display: inline-flex;
  align-items: center;
  padding: 8px 15px;
  border-radius: 4px;
  text-decoration: none;
  font-size: 0.9rem;
  transition: all 0.2s ease;
}

.github-link {
  background-color: #24292e;
  color: white;
}

.github-link svg {
  margin-right: 8px;
}

.demo-link {
  background-color: #1a73e8;
  color: white;
}

.github-link:hover, .demo-link:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.github-profile-section {
  margin-top: 50px;
  text-align: center;
  padding: 30px;
  background-color: #f8f9fa;
  border-radius: 8px;
  border: 1px solid #e9ecef;
}

.github-profile-section h3 {
  color: #1a73e8;
  margin-bottom: 15px;
}

.github-profile-section p {
  margin-bottom: 20px;
  line-height: 1.6;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.github-profile-button {
  display: inline-flex;
  align-items: center;
  padding: 10px 20px;
  background-color: #24292e;
  color: white;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s ease;
}

.github-profile-button svg {
  margin-right: 10px;
}

.github-profile-button:hover {
  transform: translateY(-3px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}
</style>