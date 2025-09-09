# 🚀 Cloud Infrastructure & Monitoring Project

This project demonstrates provisioning AWS infrastructure using **Terraform**, deploying workloads with **Helm**, automating deployments with **GitHub Actions**, and implementing **Monitoring** with **Prometheus & Grafana**.

## Applicaton Running ScreenShots
![alt text](<Screenshot 2025-09-09 112538.png>)
![alt text](<Screenshot 2025-09-09 112510.png>)


## Architecture Diagram 
Components:
Terraform Modules: VPC, IAM, EKS cluster.
GitHub Actions: Build, Test, Deploy pipeline.
Kubernetes: Application deployed via Helm.
Monitoring: Prometheus scraping metrics + Grafana dashboards as code.

---![alt text](<architecure diagram.png>)

## 🏗️ 1. Terraform Expansion
- Infrastructure is modularized.
- Modules included: **VPC**, **EKS Cluster**, **IAM Roles/Service Accounts**.
- Uses **variables** for reusability and **outputs** for integration.

---

## 🔄 2. CI/CD Enhancement
- CI/CD pipeline implemented using **GitHub Actions**.
- Stages:
  1. **Test** → Runs unit tests.
  2. **Build** → Builds Docker image & pushes to registry.
  3. **Deploy** → On merge to `main`, Helm chart auto-deploys to Kubernetes.

**Workflow file:** `.github/workflows/ci-cd.yml`

---

## 📊 3. Monitoring Expansion

### Prometheus
- Installed via Helm (`prometheus-community/prometheus`).
- Scrape annotations are already configured in the Helm Service template:

```yaml
metadata:
  annotations:
    prometheus.io/scrape: "true"
    prometheus.io/port: "{{ .Values.service.port }}"
    prometheus.io/path: "{{ .Values.serviceMonitor.path }}"

## Dashboard Screenshots
![alt text](<Screenshot 2025-09-09 100904.png>)
![alt text](<Screenshot 2025-09-09 100837.png>)
![alt text](<Screenshot 2025-09-09 101246.png>)
![alt text](<Screenshot 2025-09-09 104817.png>)
![alt text](<Screenshot 2025-09-09 105348.png>)