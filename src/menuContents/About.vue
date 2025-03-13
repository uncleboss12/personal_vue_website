<template>
  <div class="about-container">
    <div class="profile-header">
      <div class="profile-image">
        <img v-if="profileImage" :src="profileImage" alt="Justine Obiazi" />
        <div v-else class="image-placeholder">
          <span>Upload Profile Image</span>
          <input type="file" @change="handleImageUpload" accept="image/*" />
        </div>
      </div>
      <div class="profile-intro">
        <h2>About Me</h2>
        <h3>Justine Obiazi</h3>
        <p class="tagline">Civil Engineer | Cloud & DevOps Architect | Data Scientist | Data Engineer </p>
      </div>
    </div>

    <div class="profile-content">
      <section class="profile-section">
        <h3>Professional Background</h3>
        <p>
          I am Justine Obiazi, a Civil Engineer with specialized experience in Cloud and DevOps Architecture. 
          My professional journey includes valuable experience as a Data Scientist and Vue Software Developer, 
          providing me with a diverse technical background that bridges infrastructure and software development.
        </p>
      </section>

      <section class="profile-section">
        <h3>Cloud Expertise</h3>
        <p>
          Over the past three years, I have focused on developing comprehensive skills across the three major cloud 
          platforms: Amazon Web Services (AWS), Google Cloud Platform (GCP), and Microsoft Azure (Azure). This multi-cloud 
          proficiency allows me to architect solutions using the best tools for each specific use case.
        </p>
        
        <div class="image-gallery">
          <div class="gallery-image" v-for="(image, index) in cloudImages" :key="'cloud-'+index">
            <img v-if="image" :src="image" :alt="'Cloud Certification '+index" />
            <div v-else class="image-placeholder small">
              <span>Add Cloud Image</span>
              <input type="file" @change="e => handleCloudImageUpload(e, index)" accept="image/*" />
            </div>
          </div>
        </div>
      </section>

      <section class="profile-section">
        <h3>Technical Domains</h3>
        <p>
          This website showcases my continuous learning journey, highlighting various projects I've undertaken 
          across multiple disciplines:
        </p>
        <ul>
          <li><strong>Data Science:</strong> Analysis, visualization, and predictive modeling</li>
          <li><strong>Data Engineering:</strong> Building robust data pipelines and storage solutions</li>
          <li><strong>SRE/
            
            
            DevOps Engineering:</strong> CI/CD implementation and infrastructure automation</li>
        </ul>
        
        <div class="image-gallery">
          <div class="gallery-image" v-for="(image, index) in projectImages" :key="'project-'+index">
            <img v-if="image" :src="image" :alt="'Project '+index" />
            <div v-else class="image-placeholder small">
              <span>Add Project Image</span>
              <input type="file" @change="e => handleProjectImageUpload(e, index)" accept="image/*" />
            </div>
          </div>
        </div>
      </section>

      <section class="profile-section">
        <h3>About This Website</h3>
        <p>
          While software development isn't my primary focus, I built this personal website using Vue.js to 
          showcase my technical versatility. The site demonstrates modern DevOps practices:
        </p>
        <ul>
          <li>Frontend built with Vue.js</li>
          <li>Containerized using Docker</li>
          <li>CI/CD through GitHub Actions for automated deployment</li>
          <li>Artifacts stored in container registry</li>
          <li>Hosted on AWS infrastructure</li>
          <li>CloudFront for content delivery acceleration</li>
          <li>Route 53 for domain name management</li>
          <li>DynamoDB for visitor analytics</li>
        </ul>
      </section>

      <section class="profile-section">
        <h3>Next Steps</h3>
        <p>
          Thank you for visiting! Please take your time to browse through my projects and experience. 
          The blog section will be activated soon, where I'll share deeper insights into my projects and 
          technical challenges.
        </p>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AboutPage',
  data() {
    return {
      profileImage: require('@/assets/profile/profile-image.jpg'),
      cloudImages: [
        require('@/assets/certifications/aws-certification.png'),
        require('@/assets/certifications/gcp-certification.png'),
        require('@/assets/certifications/azure-certification.png')
      ],
      projectImages: [
        require('@/assets/projects/data-science-project.png'),
        require('@/assets/projects/data-engineering-project.png'),
        require('@/assets/projects/devops-project.png')
      ]
    };
  },
  methods: {
    handleImageUpload(event) {
      const file = event.target.files[0];
      if (file) {
        this.profileImage = URL.createObjectURL(file);
      }
    },
    handleCloudImageUpload(event, index) {
      const file = event.target.files[0];
      if (file) {
        this.cloudImages[index] = URL.createObjectURL(file);
      }
    },
    handleProjectImageUpload(event, index) {
      const file = event.target.files[0];
      if (file) {
        this.projectImages[index] = URL.createObjectURL(file);
      }
    }
  }
};
</script>

<style scoped>
.about-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 20px;
}

.profile-header {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 40px;
  text-align: center;
}

@media (min-width: 768px) {
  .profile-header {
    flex-direction: row;
    text-align: left;
    align-items: flex-start;
  }
}

.profile-image {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  overflow: hidden;
  margin-bottom: 20px;
  border: 3px solid #1a73e8;
}

@media (min-width: 768px) {
  .profile-image {
    margin-right: 30px;
    margin-bottom: 0;
  }
}

.profile-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.image-placeholder {
  width: 100%;
  height: 100%;
  background-color: #f0f4f8;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  position: relative;
}

.image-placeholder span {
  font-size: 14px;
  color: #555;
  margin-bottom: 5px;
}

.image-placeholder input {
  opacity: 0;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  cursor: pointer;
}

.profile-intro {
  flex: 1;
}

.profile-intro h2 {
  color: #1a73e8;
  margin-bottom: 10px;
}

.profile-intro h3 {
  font-size: 1.8rem;
  margin-bottom: 10px;
}

.tagline {
  color: #555;
  font-size: 1.1rem;
  margin-bottom: 15px;
}

.profile-section {
  margin-bottom: 30px;
}

.profile-section h3 {
  color: #1a73e8;
  margin-bottom: 15px;
  border-bottom: 1px solid #e9ecef;
  padding-bottom: 8px;
}

.profile-section p {
  line-height: 1.6;
  margin-bottom: 15px;
}

.profile-section ul {
  padding-left: 20px;
  margin-bottom: 15px;
  line-height: 1.6;
}

.image-gallery {
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
  margin: 20px 0;
}

.gallery-image {
  width: 150px;
  height: 150px;
  border-radius: 8px;
  overflow: hidden;
  border: 1px solid #e9ecef;
}

.gallery-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.image-placeholder.small {
  font-size: 12px;
}
</style>