<template>
  <div class="certification-container">
    <div class="certification-header">
      <h2>Professional Certifications</h2>
      <p>My validated cloud and DevOps credentials across multiple platforms.</p>
    </div>

    <!-- AWS Certifications -->
    <div class="certification-category">
      <div class="category-header">
        <img class="category-icon" src="@/assets/certification-icons/aws-icon.png" alt="AWS" />
        <h3>Amazon Web Services (AWS)</h3>
      </div>
      <div class="certification-grid">
        <div class="certification-card" v-for="(cert, index) in awsCertifications" :key="'aws-'+index">
          <div class="certification-logo">
            <img :src="cert.logo" :alt="cert.title" />
          </div>
          <div class="certification-details">
            <h4>{{ cert.title }}</h4>
            <p class="issue-date">Issued: {{ cert.issueDate }}</p>
            <p class="description">{{ cert.description }}</p>
            <a :href="cert.verificationLink" target="_blank" class="verify-btn">
              <span class="verify-icon">✓</span> Verify on Credly
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Google Cloud Certifications -->
    <div class="certification-category">
      <div class="category-header">
        <img class="category-icon" src="@/assets/certification-icons/gcp-icon.png" alt="GCP" />
        <h3>Google Cloud Platform (GCP)</h3>
      </div>
      <div class="certification-grid">
        <div class="certification-card" v-for="(cert, index) in gcpCertifications" :key="'gcp-'+index">
          <div class="certification-logo">
            <img :src="cert.logo" :alt="cert.title" />
          </div>
          <div class="certification-details">
            <h4>{{ cert.title }}</h4>
            <p class="issue-date">Issued: {{ cert.issueDate }}</p>
            <p class="description">{{ cert.description }}</p>
            <a :href="cert.verificationLink" target="_blank" class="verify-btn">
              <span class="verify-icon">✓</span> Verify on Credly
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Microsoft Azure Certifications -->
    <div class="certification-category">
      <div class="category-header">
        <img class="category-icon" src="@/assets/certification-icons/azure-icon.jpg" alt="Azure" />
        <h3>Microsoft Azure</h3>
      </div>
      <div class="certification-grid">
        <div class="certification-card" v-for="(cert, index) in azureCertifications" :key="'azure-'+index">
          <div class="certification-logo">
            <img :src="cert.logo" :alt="cert.title" />
          </div>
          <div class="certification-details">
            <h4>{{ cert.title }}</h4>
            <p class="issue-date">Issued: {{ cert.issueDate }}</p>
            <p class="description">{{ cert.description }}</p>
            <a :href="cert.verificationLink" target="_blank" class="verify-btn">
              <span class="verify-icon">✓</span> Verify on Microsoft Learn
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Oracle Cloud Certifications -->
    <div class="certification-category">
      <div class="category-header">
        <img class="category-icon" src="@/assets/certification-icons/oracle-icon.png" alt="Oracle" />
        <h3>Oracle Cloud Infrastructure (OCI)</h3>
      </div>
      <div class="certification-grid">
        <div class="certification-card" v-for="(cert, index) in oracleCertifications" :key="'oracle-'+index">
          <div class="certification-logo">
            <img :src="cert.logo" :alt="cert.title" />
          </div>
          <div class="certification-details">
            <h4>{{ cert.title }}</h4>
            <p class="issue-date">Issued: {{ cert.issueDate }}</p>
            <p class="description">{{ cert.description }}</p>
            <a :href="cert.verificationLink" target="_blank" class="verify-btn">
              <span class="verify-icon">✓</span> Verify on Oracle University
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Kubernetes & DevOps Certifications -->
    <div class="certification-category">
      <div class="category-header">
        <img class="category-icon" src="@/assets/certification-icons/kubernetes-icon.png" alt="Kubernetes" />
        <h3>Kubernetes & DevOps</h3>
      </div>
      <div class="certification-grid">
        <div class="certification-card" v-for="(cert, index) in devopsCertifications" :key="'devops-'+index">
          <div class="certification-logo">
            <img :src="cert.logo" :alt="cert.title" />
          </div>
          <div class="certification-details">
            <h4>{{ cert.title }}</h4>
            <p class="issue-date">Issued: {{ cert.issueDate }}</p>
            <p class="description">{{ cert.description }}</p>
            <a :href="cert.verificationLink" target="_blank" class="verify-btn">
              <span class="verify-icon">✓</span> {{ cert.verifyText }}
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CertificationPage',
  data() {
    return {
      awsCertifications: [
        {
          title: 'AWS Certified Solutions Architect - Associate',
          issueDate: 'November 2024',
          description: 'Validates ability to design and implement distributed systems on AWS.',
          logo: require('@/assets/certification-logos/aws-solutions-architect.jpg'),
          verificationLink: 'https://www.credly.com/badges/96628b54-016d-4f16-a141-c85c7a88fa50/public_url'
        },
        /*{
          title: 'AWS Certified Data Engineer - Associate',
          issueDate: 'June 2025',
          description: 'Validates technical expertise in developing and maintaining applications on AWS.',
          logo: require('@/assets/certification-logos/aws-developer.png'),
          verificationLink: 'https://www.credly.com/badges/your-badge-id'
        }*/
      ],
      gcpCertifications: [
        {
          title: 'Google Cloud Professional Data Engineer',
          issueDate: 'September 2024',
          description: 'Validates expertise in designing, developing, and managing secure, scalable solutions on Google Cloud.',
          logo: require('@/assets/certification-logos/gcp-engineer.png'),
          verificationLink: 'https://www.credly.com/badges/b586d13c-a3c5-4f68-8467-2f789d8aaf3b/public_url'
        }
      ],
      azureCertifications: [
        {
          title: 'Microsoft Certified: Azure Data Scientist Associate',
          issueDate: 'August 2024',
          description: 'Validates expertise in designing and implementing solutions on Microsoft Azure.',
          logo: require('@/assets/certification-logos/azure-data-scientist.png'),
          verificationLink: 'https://learn.microsoft.com/en-us/users/justineobiazi-2590/credentials/26d1e3d063410907?ref=https%3A%2F%2Fwww.linkedin.com%2F'
        },
        {
          title: 'Microsoft Certified: Azure Data Engineer Associate',
          issueDate: 'April 2025',
          description: 'Validates skills in implementing, monitoring, and maintaining Microsoft Azure solutions.',
          logo: require('@/assets/certification-logos/azure-data-engineer.png'),
          verificationLink: 'https://learn.microsoft.com/api/credentials/share/en-us/JustineObiazi-2590/E06E4416C0B1FDC2?sharingId=223C2363C6C9D342'
        }
      ],
      oracleCertifications: [
        {
          title: 'Oracle Cloud Infrastructure Generative AI Professional',
          issueDate: 'July 2024',
          description: 'Validates expertise in designing and implementing OCI solutions.',
          logo: require('@/assets/certification-logos/oracle-gen-ai.jpg'),
          verificationLink: null
        }
      ],
      /*devopsCertifications: [
        {
          title: 'Certified Kubernetes Administrator (CKA)',
          issueDate: 'April 2025',
          description: 'Validates expertise in Kubernetes administration and cluster management.',
          logo: require('@/assets/certification-logos/cka.png'),
          verificationLink: 'https://training.linuxfoundation.org/certification/verify/',
          verifyText: 'Verify on Linux Foundation'
        },
        {
          title: 'HashiCorp Certified: Terraform Associate',
          issueDate: 'April 2025',
          description: 'Validates expertise in infrastructure as code using HashiCorp Terraform.',
          logo: require('@/assets/certification-logos/terraform-associate.jpg'),
          verificationLink: 'https://www.credly.com/badges/your-badge-id',
          verifyText: 'Verify on Credly'
        }
      ]*/
    };
  }
};
</script>

<style scoped>
.certification-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

.certification-header {
  text-align: center;
  margin-bottom: 40px;
}

.certification-header h2 {
  color: #1a73e8;
  margin-bottom: 10px;
  font-size: 2rem;
}

.certification-header p {
  color: #555;
  font-size: 1.1rem;
}

.certification-category {
  margin-bottom: 40px;
  border: 1px solid #e9ecef;
  border-radius: 8px;
  overflow: hidden;
}

.category-header {
  background-color: #f8f9fa;
  padding: 15px 20px;
  display: flex;
  align-items: center;
  border-bottom: 1px solid #e9ecef;
}

.category-icon {
  width: 30px;
  height: 30px;
  margin-right: 15px;
}

.category-header h3 {
  color: #333;
  margin: 0;
}

.certification-grid {
  padding: 20px;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(450px, 1fr));
  gap: 20px;
}

.certification-card {
  border: 1px solid #e9ecef;
  border-radius: 8px;
  overflow: hidden;
  display: flex;
  background-color: white;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
  transition: transform 0.2s, box-shadow 0.2s;
}

.certification-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.certification-logo {
  width: 100px;
  min-width: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #f8f9fa;
  padding: 15px;
}

.certification-logo img {
  max-width: 100%;
  max-height: 80px;
}

.certification-details {
  padding: 15px;
  flex-grow: 1;
}

.certification-details h4 {
  margin: 0 0 8px 0;
  color: #1a73e8;
}

.issue-date {
  color: #666;
  font-size: 0.9rem;
  margin-bottom: 8px;
}

.description {
  margin-bottom: 15px;
  font-size: 0.95rem;
  line-height: 1.5;
}

.verify-btn {
  display: inline-flex;
  align-items: center;
  padding: 8px 12px;
  background-color: #e8f0fe;
  color: #1a73e8;
  text-decoration: none;
  border-radius: 4px;
  font-size: 0.9rem;
  transition: background-color 0.2s;
}

.verify-btn:hover {
  background-color: #d2e3fc;
}

.verify-icon {
  margin-right: 6px;
}

@media (max-width: 768px) {
  .certification-grid {
    grid-template-columns: 1fr;
  }
  
  .certification-card {
    flex-direction: column;
  }
  
  .certification-logo {
    width: 100%;
    min-width: 100%;
    padding: 20px;
  }
}
</style>